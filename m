Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 909137BD41
	for <lists+dm-devel@lfdr.de>; Wed, 31 Jul 2019 11:34:33 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6FFAA80F79;
	Wed, 31 Jul 2019 09:34:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D6E76600F8;
	Wed, 31 Jul 2019 09:34:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E7F57264C8;
	Wed, 31 Jul 2019 09:34:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6UBcUHo018104 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 30 Jul 2019 07:38:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 742435C1B5; Tue, 30 Jul 2019 11:38:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B925B5C1B4;
	Tue, 30 Jul 2019 11:38:21 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8AF84149E0;
	Tue, 30 Jul 2019 11:38:21 +0000 (UTC)
Date: Tue, 30 Jul 2019 07:38:21 -0400 (EDT)
From: Pankaj Gupta <pagupta@redhat.com>
To: snitzer@redhat.com, dan j williams <dan.j.williams@intel.com>
Message-ID: <2030283543.5419072.1564486701158.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190730113708.14660-1-pagupta@redhat.com>
References: <20190730113708.14660-1-pagupta@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.116.177, 10.4.195.28]
Thread-Topic: fix dax_dev NULL dereference
Thread-Index: DJwGj3eAs0AsRYOTmWq49b3nMP9dlA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 31 Jul 2019 05:34:14 -0400
Cc: jencce.kernel@gmail.com, linux-nvdimm@lists.01.org,
	linux-kernel@vger.kernel.org, dm-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, agk@redhat.com
Subject: Re: [dm-devel] [PATCH] dm: fix dax_dev NULL dereference
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Wed, 31 Jul 2019 09:34:32 +0000 (UTC)



+CC [jencce.kernel@gmail.com]
> 
> 
>   'Murphy Zhou' reports[1] hitting the panic when running xfstests
>   generic/108 on pmem ramdisk. In his words:
> 
>    This test is simulating partial disk error when calling fsync():
>    create a lvm vg which consists of 2 disks:
>    one scsi_debug disk; one other disk I specified, pmem ramdisk in this
>    case.
>    create lv in this vg and write to it, make sure writing across 2 disks;
>    offline scsi_debug disk;
>    write again to allocated area;
>    expect fsync: IO error.
>    If one of the disks is pmem ramdisk, it reproduces every time on my setup,
>    on v5.3-rc2+.
>    The mount -o dax option is not required to reproduce this panic.
>    ...
> 
>   Fix this by returning false from 'device_synchronous' function when dax_dev
>   is NULL.
> 
>  [ 1984.878208] BUG: kernel NULL pointer dereference, address:
>  00000000000002d0
>  [ 1984.882546] #PF: supervisor read access in kernel mode
>  [ 1984.885664] #PF: error_code(0x0000) - not-present page
>  [ 1984.888626] PGD 0 P4D 0
>  [ 1984.890140] Oops: 0000 [#1] SMP PTI
>  ...
>  ...
>  [ 1984.943682] Call Trace:
>  [ 1984.945007]  device_synchronous+0xe/0x20 [dm_mod]
>  [ 1984.947328]  stripe_iterate_devices+0x48/0x60 [dm_mod]
>  [ 1984.949947]  ? dm_set_device_limits+0x130/0x130 [dm_mod]
>  [ 1984.952516]  dm_table_supports_dax+0x39/0x90 [dm_mod]
>  [ 1984.954989]  dm_table_set_restrictions+0x248/0x5d0 [dm_mod]
>  [ 1984.957685]  dm_setup_md_queue+0x66/0x110 [dm_mod]
>  [ 1984.960280]  table_load+0x1e3/0x390 [dm_mod]
>  [ 1984.962491]  ? retrieve_status+0x1c0/0x1c0 [dm_mod]
>  [ 1984.964910]  ctl_ioctl+0x1d3/0x550 [dm_mod]
>  [ 1984.967006]  ? path_lookupat+0xf4/0x200
>  [ 1984.968890]  dm_ctl_ioctl+0xa/0x10 [dm_mod]
>  [ 1984.970920]  do_vfs_ioctl+0xa9/0x630
>  [ 1984.972701]  ksys_ioctl+0x60/0x90
>  [ 1984.974335]  __x64_sys_ioctl+0x16/0x20
>  [ 1984.976221]  do_syscall_64+0x5b/0x1d0
>  [ 1984.978091]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> 
>  [1]
>  https://lore.kernel.org/linux-fsdevel/2011806368.5335560.1564469373050.JavaMail.zimbra@redhat.com/T/#mac662eb50b9d7bd282b23e6e8625a3f7a4687506
> 
> Fixes: 2e9ee0955d3c ("dm: enable synchronous dax")
> Reported-by: jencce.kernel@gmail.com
> Tested-by: jencce.kernel@gmail.com
> Signed-off-by: Pankaj Gupta <pagupta@redhat.com>
> ---
>  drivers/md/dm-table.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
> index caaee8032afe..b065845c1bdd 100644
> --- a/drivers/md/dm-table.c
> +++ b/drivers/md/dm-table.c
> @@ -894,6 +894,9 @@ int device_supports_dax(struct dm_target *ti, struct
> dm_dev *dev,
>  static int device_synchronous(struct dm_target *ti, struct dm_dev *dev,
>  				       sector_t start, sector_t len, void *data)
>  {
> +	if (!dev->dax_dev)
> +		return false;
> +
>  	return dax_synchronous(dev->dax_dev);
>  }
>  
> --
> 2.20.1
> 
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
