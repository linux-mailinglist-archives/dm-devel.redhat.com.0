Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id EA996178747
	for <lists+dm-devel@lfdr.de>; Wed,  4 Mar 2020 01:55:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583283347;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SWEpKicYGAjkL6pfCVqeD7ONoYHrvmPGZrPwPI+oMKY=;
	b=gg3amO+CuSfIhxBiQPLGEiPkb3BIRmLMi0P0fe5JiwKKQhx/1FyoWFqYvzA6OLDJOOVJac
	Q+Wps8EUwUr/d3c8idGOc74oM7moIyqYQ+lARGiq4FhqhNXXTx5Y1xnzNkgPc6kRQyzWzs
	YyIQ6am6JiBRbaA6A77Hccd+ha5J6h4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-TyDmR64nNK-PY6I3dOX_Pw-1; Tue, 03 Mar 2020 19:55:45 -0500
X-MC-Unique: TyDmR64nNK-PY6I3dOX_Pw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00C7F800D4E;
	Wed,  4 Mar 2020 00:55:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AE9F5C1D4;
	Wed,  4 Mar 2020 00:55:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B1B5484468;
	Wed,  4 Mar 2020 00:55:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0240t3bP000773 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 3 Mar 2020 19:55:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D2FDA7C58; Wed,  4 Mar 2020 00:55:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CDD1FF4D5C
	for <dm-devel@redhat.com>; Wed,  4 Mar 2020 00:55:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE95D800307
	for <dm-devel@redhat.com>; Wed,  4 Mar 2020 00:55:01 +0000 (UTC)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-494-uH5S1XBBNquVnXmV0HGH5w-1; Tue, 03 Mar 2020 19:54:59 -0500
X-MC-Unique: uH5S1XBBNquVnXmV0HGH5w-1
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 33DC3FDE9E9E0FB38332;
	Wed,  4 Mar 2020 08:54:55 +0800 (CST)
Received: from [127.0.0.1] (10.133.219.224) by DGGEMS401-HUB.china.huawei.com
	(10.3.19.201) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 4 Mar 2020 08:54:51 +0800
To: Mike Snitzer <snitzer@redhat.com>
References: <20200303084501.8912-1-houtao1@huawei.com>
	<20200303161535.GA8578@redhat.com>
From: Hou Tao <houtao1@huawei.com>
Message-ID: <291558e3-4f07-b9a8-f138-91b929fa40c9@huawei.com>
Date: Wed, 4 Mar 2020 08:54:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20200303161535.GA8578@redhat.com>
Content-Language: en-US
X-Originating-IP: [10.133.219.224]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0240t3bP000773
X-loop: dm-devel@redhat.com
Cc: tj@kernel.org, dm-devel@redhat.com, agk@redhat.com
Subject: Re: [dm-devel] dm: fix congested_fn for request-based device
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Mike,

On 2020/3/4 0:15, Mike Snitzer wrote:
> On Tue, Mar 03 2020 at  3:45am -0500,
> Hou Tao <houtao1@huawei.com> wrote:
> 
>> We neither assign congested_fn for requested-based blk-mq device
>> nor implement it correctly. So fix both.
>>
>> Fixes: 4aa9c692e052 ("bdi: separate out congested state into a separate struct")
>> Signed-off-by: Hou Tao <houtao1@huawei.com>
>> ---
>>  drivers/md/dm.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/md/dm.c b/drivers/md/dm.c
>> index b89f07ee2eff..80b95e21db43 100644
>> --- a/drivers/md/dm.c
>> +++ b/drivers/md/dm.c
>> @@ -1784,11 +1784,13 @@ static int dm_any_congested(void *congested_data, int bdi_bits)
>>  
>>  	if (!test_bit(DMF_BLOCK_IO_FOR_SUSPEND, &md->flags)) {
>>  		if (dm_request_based(md)) {
>> +			struct backing_dev_info *bdi =
>> +				md->queue->backing_dev_info;
>>  			/*
>>  			 * With request-based DM we only need to check the
>>  			 * top-level queue for congestion.
>>  			 */
>> -			r = md->queue->backing_dev_info->wb.state & bdi_bits;
>> +			r = bdi->wb.congested->state & bdi_bits;
>>  		} else {
>>  			map = dm_get_live_table_fast(md);
>>  			if (map)
> 
> The above change does indeed fix missing conversion that should've
> occurred in commit 4aa9c692e052.
> 
>> @@ -2265,6 +2267,7 @@ int dm_setup_md_queue(struct mapped_device *md, struct dm_table *t)
>>  			DMERR("Cannot initialize queue for request-based dm-mq mapped device");
>>  			return r;
>>  		}
>> +		dm_init_normal_md_queue(md);
>>  		break;
>>  	case DM_TYPE_BIO_BASED:
>>  	case DM_TYPE_DAX_BIO_BASED:
> 
> I've renamed dm_init_normal_md_queue to dm_init_congested_fn and removed
> it's incorrect comment.
> 
Thanks for that.

Regards,
Tao
> Here is the final fix I just staged:
> https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.6&id=974f51e8633f0f3f33e8f86bbb5ae66758aa63c7
> 
> Thanks,
> Mike
> 
> 
> .
> 


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

