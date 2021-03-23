Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 15A0E346608
	for <lists+dm-devel@lfdr.de>; Tue, 23 Mar 2021 18:12:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616519530;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/L87ypSyXXFct2zUtcP+tcCyVMyZtxNbWlVaAZlkZHo=;
	b=F79AOHdOd7WTRJlvqcAZ2XiZQEdVZWv8xtKlk28lwdc/2h4uQYcX7tVnGrt1QH6JKmeKaJ
	ygJAh/tprc9/MexJ449PKvIIlvU8wbUr7KCUGvHDu2KMJYTjnEWSmls9RrNcFWD8tktbVV
	klVSQ19iMfj9JUjWT6RgQnlNbBZCfyU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-lunVRSlmOnSFGXCzWaabmg-1; Tue, 23 Mar 2021 13:12:07 -0400
X-MC-Unique: lunVRSlmOnSFGXCzWaabmg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36B966A290;
	Tue, 23 Mar 2021 17:12:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 34B5E610AF;
	Tue, 23 Mar 2021 17:11:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A98061809C83;
	Tue, 23 Mar 2021 17:11:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12NHBjdh026648 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 23 Mar 2021 13:11:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A47CA5C26D; Tue, 23 Mar 2021 17:11:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from ovpn-112-207.phx2.redhat.com (ovpn-112-207.phx2.redhat.com
	[10.3.112.207])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0EB045C232;
	Tue, 23 Mar 2021 17:11:30 +0000 (UTC)
Message-ID: <5612cd9e298488ea9277f8d99ce0fd35240bdc53.camel@redhat.com>
From: "Ewan D. Milne" <emilne@redhat.com>
To: lixiaokeng <lixiaokeng@huawei.com>, Mike Snitzer <snitzer@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	Zhiqiang Liu <liuzhiqiang26@huawei.com>
Date: Tue, 23 Mar 2021 13:11:30 -0400
In-Reply-To: <a46013db-8143-7b41-95a8-182439b385f2@huawei.com>
References: <c8f86351-3036-0945-90d2-2e020d68ccf2@huawei.com>
	<20210322081155.GE1946905@infradead.org>
	<20210322142207.GB30698@redhat.com>
	<a46013db-8143-7b41-95a8-182439b385f2@huawei.com>
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: "wubo \(T\)" <wubo40@huawei.com>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	linux-scsi@vger.kernel.org, "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
	linux-kernel@vger.kernel.org, linfeilong <linfeilong@huawei.com>,
	dm-devel@redhat.com, agk@redhat.com
Subject: Re: [dm-devel] md/dm-mpath: check whether all pgpaths have same
 uuid in multipath_ctr()
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2021-03-23 at 15:47 +0800, lixiaokeng wrote:
> 
> On 2021/3/22 22:22, Mike Snitzer wrote:
> > On Mon, Mar 22 2021 at  4:11am -0400,
> > Christoph Hellwig <hch@infradead.org> wrote:
> > 
> > > On Sat, Mar 20, 2021 at 03:19:23PM +0800, Zhiqiang Liu wrote:
> > > > From: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> > > > 
> > > > When we make IO stress test on multipath device, there will
> > > > be a metadata err because of wrong path. In the test, we
> > > > concurrent execute 'iscsi device login|logout' and
> > > > 'multipath -r' command with IO stress on multipath device.
> > > > In some case, systemd-udevd may have not time to process
> > > > uevents of iscsi device logout|login, and then 'multipath -r'
> > > > command triggers multipathd daemon calls ioctl to load table
> > > > with incorrect old device info from systemd-udevd.
> > > > Then, one iscsi path may be incorrectly attached to another
> > > > multipath which has different uuid. Finally, the metadata err
> > > > occurs when umounting filesystem to down write metadata on
> > > > the iscsi device which is actually not owned by the multipath
> > > > device.
> > > > 
> > > > So we need to check whether all pgpaths of one multipath have
> > > > the same uuid, if not, we should throw a error.
> > > > 
> > > > Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> > > > Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
> > > > Signed-off-by: linfeilong <linfeilong@huawei.com>
> > > > Signed-off-by: Wubo <wubo40@huawei.com>
> > > > ---
> > > >  drivers/md/dm-mpath.c   | 52
> > > > +++++++++++++++++++++++++++++++++++++++++
> > > >  drivers/scsi/scsi_lib.c |  1 +
> > > >  2 files changed, 53 insertions(+)
> > > > 
> > > > diff --git a/drivers/md/dm-mpath.c b/drivers/md/dm-mpath.c
> > > > index bced42f082b0..f0b995784b53 100644
> > > > --- a/drivers/md/dm-mpath.c
> > > > +++ b/drivers/md/dm-mpath.c
> > > > @@ -24,6 +24,7 @@
> > > >  #include <linux/workqueue.h>
> > > >  #include <linux/delay.h>
> > > >  #include <scsi/scsi_dh.h>
> > > > +#include <linux/dm-ioctl.h>
> > > >  #include <linux/atomic.h>
> > > >  #include <linux/blk-mq.h>
> > > > 
> > > > @@ -1169,6 +1170,45 @@ static int parse_features(struct
> > > > dm_arg_set *as, struct multipath *m)
> > > >  	return r;
> > > >  }
> > > > 
> > > > +#define SCSI_VPD_LUN_ID_PREFIX_LEN 4
> > > > +#define MPATH_UUID_PREFIX_LEN 7
> > > > +static int check_pg_uuid(struct priority_group *pg, char
> > > > *md_uuid)
> > > > +{
> > > > +	char pgpath_uuid[DM_UUID_LEN] = {0};
> > > > +	struct request_queue *q;
> > > > +	struct pgpath *pgpath;
> > > > +	struct scsi_device *sdev;
> > > > +	ssize_t count;
> > > > +	int r = 0;
> > > > +
> > > > +	list_for_each_entry(pgpath, &pg->pgpaths, list) {
> > > > +		q = bdev_get_queue(pgpath->path.dev->bdev);
> > > > +		sdev = scsi_device_from_queue(q);
> > > 
> > > Common dm-multipath code should never poke into scsi
> > > internals.  This
> > > is something for the device handler to check.  It probably also
> > > won't
> > > work for all older devices.
> > 
> > Definitely.
> > 
> > But that aside, userspace (multipathd) _should_ be able to do extra
> > validation, _before_ pushing down a new table to the kernel, rather
> > than
> > forcing the kernel to do it.
> > 
> 
> Martin (committer of multipath-tools) said that:
> "Don't get me wrong, I don't argue against tough testing. But we
> should
> be aware that there are always time intervals during which
> multipathd's
> picture of the present devices is different from what the kernel
> sees."
> 
> It is difficult to solve this in multipathd.
> 
> Regards,
> Lixiaokeng
> 

I think the patch is no good.  There are plenty of devices that don't
support VPD page 83h:

int scsi_vpd_lun_id(struct scsi_device *sdev, char *id, size_t id_len)
{
        u8 cur_id_type = 0xff;
        u8 cur_id_size = 0;
        unsigned char *d, *cur_id_str;
        unsigned char __rcu *vpd_pg83;
        int id_size = -EINVAL;

        rcu_read_lock();
        vpd_pg83 = rcu_dereference(sdev->vpd_pg83);
        if (!vpd_pg83) {
                rcu_read_unlock();
                return -ENXIO;
        }

and the DM layer should not be looking at the properties of the
underlying devices in this way anyway.  It should be pushed down
to the table.

-Ewan



--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

