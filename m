Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9905A1BE78E
	for <lists+dm-devel@lfdr.de>; Wed, 29 Apr 2020 21:42:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588189320;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dHMDHSgNfMXuF585vJdZfyowxtwKHAmbxnF+9sXvTcQ=;
	b=Tnn8svrp7my++SYVyzxH6Hc04kwnP4jPYQKIw6sQNACNIFYavgFTR/oip6o6ugEPZR8EcH
	XiuoGIWvh7tXYSd5pvNJGDSo4SqLo0l79cR73HCrtSD7ki4XhnnubLTDCmdqhtcEQkJe+j
	3+odPFj0whoqSbuALO6y9DvJ4fd9rBY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-GCnxI98ePJy_b9FRzWV-cQ-1; Wed, 29 Apr 2020 15:41:57 -0400
X-MC-Unique: GCnxI98ePJy_b9FRzWV-cQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF8C9107ACF2;
	Wed, 29 Apr 2020 19:41:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6315D605E1;
	Wed, 29 Apr 2020 19:41:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0B0B14CA95;
	Wed, 29 Apr 2020 19:41:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03TJeu6h006711 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 29 Apr 2020 15:40:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5895E66064; Wed, 29 Apr 2020 19:40:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from [192.168.1.10] (unknown [10.40.193.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B815266066;
	Wed, 29 Apr 2020 19:40:49 +0000 (UTC)
To: Mike Snitzer <snitzer@redhat.com>
References: <dff475cd16489080bb229af9bb45c0d67480b8be.1588172814.git.heinzm@redhat.com>
	<20200429152253.GA22958@redhat.com>
From: Heinz Mauelshagen <heinzm@redhat.com>
Message-ID: <cf22a122-13cf-2692-0e35-cce2fac007fa@redhat.com>
Date: Wed, 29 Apr 2020 21:40:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429152253.GA22958@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] dm ebs: fix bio->bi_status assignment
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

On 4/29/20 5:22 PM, Mike Snitzer wrote:
> On Wed, Apr 29 2020 at 11:07am -0400,
> heinzm@redhat.com <heinzm@redhat.com> wrote:
>
>> From: Heinz Mauelshagen <heinzm@redhat.com>
>>
>> Assign blk_status_t to bi_status properly in __ebs_process_bios()
>> on error (flaw found by static checker).
>>
>> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>> Signed-off-by: Heinz Mauelshagen <heinzm@redhat.com>
>> ---
>>   drivers/md/dm-ebs-target.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/md/dm-ebs-target.c b/drivers/md/dm-ebs-target.c
>> index 97703c31771f..c9c66d6b1e56 100644
>> --- a/drivers/md/dm-ebs-target.c
>> +++ b/drivers/md/dm-ebs-target.c
>> @@ -210,7 +210,8 @@ static void __ebs_process_bios(struct work_struct *ws)
>>   			r = __ebs_discard_bio(ec, bio);
>>   		}
>>   
>> -		bio->bi_status = r;
>> +		if (r < 0)
>> +			bio->bi_status = BLK_STS_IOERR;
>>   	}
>>   
>>   	/*
>> -- 
>> 2.25.4
>>
> Proper way is to use errno_to_blk_status().  I've folded in:
>
> -		bio->bi_status = r;
> +		if (r < 0)
> +			bio->bi_status = errno_to_blk_status(r);


Also, using errno_to_blk_status() doesn't need the conditional so you 
may mind to remove it.

Heinz


> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://www.redhat.com/mailman/listinfo/dm-devel

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

