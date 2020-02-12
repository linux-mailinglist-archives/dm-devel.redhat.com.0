Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 2652C1659C1
	for <lists+dm-devel@lfdr.de>; Thu, 20 Feb 2020 10:06:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582189585;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=25bdGyI0m7lEY7UhXJkfOpVf6mymBIMOswYbwjSQcCs=;
	b=CN0DjwFg0/O3aFyLs0cj/Yg5RtaQ40CpHJQfe16xEFhjvpdhSQ6fIkoGf4TyXo68bgUZbk
	o2KtOzSABqEFFW9Q5cyvq94cBfEZjSYmSn9ImpgS5a7/P8+FFwmtr7fkup4tPo8Z8WimKq
	v43AuojSX3vR8aRth4Awute9DYSQjfI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-4W7DYV8RNp2NQ1QeLpVSvA-1; Thu, 20 Feb 2020 04:06:20 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8533018AB2C3;
	Thu, 20 Feb 2020 09:06:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 58D9385735;
	Thu, 20 Feb 2020 09:06:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BADC18B2CC;
	Thu, 20 Feb 2020 09:06:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01CHZHQr002769 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Feb 2020 12:35:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 386601003342; Wed, 12 Feb 2020 17:35:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 333771004C47
	for <dm-devel@redhat.com>; Wed, 12 Feb 2020 17:35:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66EC9802897
	for <dm-devel@redhat.com>; Wed, 12 Feb 2020 17:35:15 +0000 (UTC)
Received: from relay.sw.ru (relay.sw.ru [185.231.240.75]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-363-3istYdWBOca4NNq5tbjE_w-1;
	Wed, 12 Feb 2020 12:35:11 -0500
Received: from [192.168.15.107] by relay.sw.ru with esmtp (Exim 4.92.3)
	(envelope-from <ktkhai@virtuozzo.com>)
	id 1j1vuX-0007GT-JU; Wed, 12 Feb 2020 20:34:53 +0300
To: "Darrick J. Wong" <darrick.wong@oracle.com>
References: <158132703141.239613.3550455492676290009.stgit@localhost.localdomain>
	<158132724397.239613.16927024926439560344.stgit@localhost.localdomain>
	<20200212170156.GM6874@magnolia>
From: Kirill Tkhai <ktkhai@virtuozzo.com>
Message-ID: <786c991e-cfaa-b2af-cac2-7165e6d7fa34@virtuozzo.com>
Date: Wed, 12 Feb 2020 20:34:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200212170156.GM6874@magnolia>
Content-Language: en-US
X-MC-Unique: 3istYdWBOca4NNq5tbjE_w-1
X-MC-Unique: 4W7DYV8RNp2NQ1QeLpVSvA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01CHZHQr002769
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 20 Feb 2020 04:05:51 -0500
Cc: andrea.parri@amarulasolutions.com, snitzer@redhat.com, dhowells@redhat.com,
	song@kernel.org, dm-devel@redhat.com, adilger.kernel@dilger.ca,
	osandov@fb.com, agk@redhat.com, hare@suse.com,
	bvanassche@acm.org, bob.liu@oracle.com, minwoo.im.dev@gmail.com,
	jthumshirn@suse.de, ajay.joshi@wdc.com,
	Chaitanya.Kulkarni@wdc.com, ming.lei@redhat.com,
	linux-block@vger.kernel.org, dsterba@suse.com, sagi@grimberg.me,
	axboe@kernel.dk, damien.lemoal@wdc.com, tytso@mit.edu,
	martin.petersen@oracle.com, linux-kernel@vger.kernel.org,
	tj@kernel.org, asml.silence@gmail.com
Subject: Re: [dm-devel] [PATCH v6 6/6] loop: Add support for REQ_ALLOCATE
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 12.02.2020 20:01, Darrick J. Wong wrote:
> On Mon, Feb 10, 2020 at 12:34:04PM +0300, Kirill Tkhai wrote:
>> Support for new modifier of REQ_OP_WRITE_ZEROES command.
>> This results in allocation extents in backing file instead
>> of actual blocks zeroing.
>>
>> Signed-off-by: Kirill Tkhai <ktkhai@virtuozzo.com>
>> Reviewed-by: Bob Liu <bob.liu@oracle.com>
>> ---
>>  drivers/block/loop.c |   15 ++++++++++++---
>>  1 file changed, 12 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/block/loop.c b/drivers/block/loop.c
>> index 739b372a5112..bfe76d9adf09 100644
>> --- a/drivers/block/loop.c
>> +++ b/drivers/block/loop.c
>> @@ -581,6 +581,15 @@ static int lo_rw_aio(struct loop_device *lo, struct loop_cmd *cmd,
>>  	return 0;
>>  }
>>  
>> +static unsigned int write_zeroes_to_fallocate_mode(unsigned int flags)
>> +{
>> +	if (flags & REQ_ALLOCATE)
>> +		return 0;
>> +	if (flags & REQ_NOUNMAP)
>> +		return FALLOC_FL_ZERO_RANGE;
>> +	return FALLOC_FL_PUNCH_HOLE;
>> +}
>> +
>>  static int do_req_filebacked(struct loop_device *lo, struct request *rq)
>>  {
>>  	struct loop_cmd *cmd = blk_mq_rq_to_pdu(rq);
>> @@ -604,9 +613,7 @@ static int do_req_filebacked(struct loop_device *lo, struct request *rq)
>>  		 * write zeroes the range.  Otherwise, punch them out.
>>  		 */
> 
> Please update this comment to reflect the new REQ_ALLOCATE mode, and
> move it to where you define write_zeroes_to_fallocate_mode().

Ok, I'll update it in v7

> With that fixed,
> 
> Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>

Thanks


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

