Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0665634590D
	for <lists+dm-devel@lfdr.de>; Tue, 23 Mar 2021 08:48:07 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-lTPmFmEwP4WBZakzcVmm-A-1; Tue, 23 Mar 2021 03:48:04 -0400
X-MC-Unique: lTPmFmEwP4WBZakzcVmm-A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E68FB107ACCD;
	Tue, 23 Mar 2021 07:47:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB6A61A353;
	Tue, 23 Mar 2021 07:47:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B52414BB7C;
	Tue, 23 Mar 2021 07:47:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12N7lM81002843 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 23 Mar 2021 03:47:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3BC9C2026D65; Tue, 23 Mar 2021 07:47:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3613A2026D6A
	for <dm-devel@redhat.com>; Tue, 23 Mar 2021 07:47:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF0151021E07
	for <dm-devel@redhat.com>; Tue, 23 Mar 2021 07:47:18 +0000 (UTC)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com
	[45.249.212.191]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-579-f9-4zHweO-WYsqX1yRFNQw-1; Tue, 23 Mar 2021 03:47:16 -0400
X-MC-Unique: f9-4zHweO-WYsqX1yRFNQw-1
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F4Ngt3qSGzrWks;
	Tue, 23 Mar 2021 15:45:14 +0800 (CST)
Received: from [10.174.178.113] (10.174.178.113) by
	DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server
	id 14.3.498.0; Tue, 23 Mar 2021 15:47:06 +0800
To: Mike Snitzer <snitzer@redhat.com>, Christoph Hellwig <hch@infradead.org>, 
	Zhiqiang Liu <liuzhiqiang26@huawei.com>
References: <c8f86351-3036-0945-90d2-2e020d68ccf2@huawei.com>
	<20210322081155.GE1946905@infradead.org>
	<20210322142207.GB30698@redhat.com>
From: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <a46013db-8143-7b41-95a8-182439b385f2@huawei.com>
Date: Tue, 23 Mar 2021 15:47:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210322142207.GB30698@redhat.com>
X-Originating-IP: [10.174.178.113]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-GB
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 2021/3/22 22:22, Mike Snitzer wrote:
> On Mon, Mar 22 2021 at  4:11am -0400,
> Christoph Hellwig <hch@infradead.org> wrote:
> 
>> On Sat, Mar 20, 2021 at 03:19:23PM +0800, Zhiqiang Liu wrote:
>>> From: Zhiqiang Liu <liuzhiqiang26@huawei.com>
>>>
>>> When we make IO stress test on multipath device, there will
>>> be a metadata err because of wrong path. In the test, we
>>> concurrent execute 'iscsi device login|logout' and
>>> 'multipath -r' command with IO stress on multipath device.
>>> In some case, systemd-udevd may have not time to process
>>> uevents of iscsi device logout|login, and then 'multipath -r'
>>> command triggers multipathd daemon calls ioctl to load table
>>> with incorrect old device info from systemd-udevd.
>>> Then, one iscsi path may be incorrectly attached to another
>>> multipath which has different uuid. Finally, the metadata err
>>> occurs when umounting filesystem to down write metadata on
>>> the iscsi device which is actually not owned by the multipath
>>> device.
>>>
>>> So we need to check whether all pgpaths of one multipath have
>>> the same uuid, if not, we should throw a error.
>>>
>>> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
>>> Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
>>> Signed-off-by: linfeilong <linfeilong@huawei.com>
>>> Signed-off-by: Wubo <wubo40@huawei.com>
>>> ---
>>>  drivers/md/dm-mpath.c   | 52 +++++++++++++++++++++++++++++++++++++++++
>>>  drivers/scsi/scsi_lib.c |  1 +
>>>  2 files changed, 53 insertions(+)
>>>
>>> diff --git a/drivers/md/dm-mpath.c b/drivers/md/dm-mpath.c
>>> index bced42f082b0..f0b995784b53 100644
>>> --- a/drivers/md/dm-mpath.c
>>> +++ b/drivers/md/dm-mpath.c
>>> @@ -24,6 +24,7 @@
>>>  #include <linux/workqueue.h>
>>>  #include <linux/delay.h>
>>>  #include <scsi/scsi_dh.h>
>>> +#include <linux/dm-ioctl.h>
>>>  #include <linux/atomic.h>
>>>  #include <linux/blk-mq.h>
>>>
>>> @@ -1169,6 +1170,45 @@ static int parse_features(struct dm_arg_set *as, struct multipath *m)
>>>  	return r;
>>>  }
>>>
>>> +#define SCSI_VPD_LUN_ID_PREFIX_LEN 4
>>> +#define MPATH_UUID_PREFIX_LEN 7
>>> +static int check_pg_uuid(struct priority_group *pg, char *md_uuid)
>>> +{
>>> +	char pgpath_uuid[DM_UUID_LEN] = {0};
>>> +	struct request_queue *q;
>>> +	struct pgpath *pgpath;
>>> +	struct scsi_device *sdev;
>>> +	ssize_t count;
>>> +	int r = 0;
>>> +
>>> +	list_for_each_entry(pgpath, &pg->pgpaths, list) {
>>> +		q = bdev_get_queue(pgpath->path.dev->bdev);
>>> +		sdev = scsi_device_from_queue(q);
>>
>> Common dm-multipath code should never poke into scsi internals.  This
>> is something for the device handler to check.  It probably also won't
>> work for all older devices.
> 
> Definitely.
> 
> But that aside, userspace (multipathd) _should_ be able to do extra
> validation, _before_ pushing down a new table to the kernel, rather than
> forcing the kernel to do it.
> 

Martin (committer of multipath-tools) said that:
"Don't get me wrong, I don't argue against tough testing. But we should
be aware that there are always time intervals during which multipathd's
picture of the present devices is different from what the kernel sees."

It is difficult to solve this in multipathd.

Regards,
Lixiaokeng

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

