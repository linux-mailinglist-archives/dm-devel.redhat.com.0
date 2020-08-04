Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id A8AEF23BCB6
	for <lists+dm-devel@lfdr.de>; Tue,  4 Aug 2020 16:54:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596552864;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fGCMkTDYUnu/UlF/p5lBqbknaUiGw4wNcvaeWgz+wrw=;
	b=EkrN5Q6K/nMyHPAzQTHVsO31SNy3rmCxj4erofuC1+hcPo6AuaWwEtFjsNEKoKLNH5CnC9
	6QKmbrkmXUstR+pvOog1JdEDh6x0l7fbIecPDy+xfGfIZF++w4DOkiQZ9meiNPr/4J3Pw+
	JwUJrl1eCVgACuGfLQj1QAyuVnBbc8E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-XKzvbr1vMxyRtEnsFP6FYg-1; Tue, 04 Aug 2020 10:54:22 -0400
X-MC-Unique: XKzvbr1vMxyRtEnsFP6FYg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33C751005504;
	Tue,  4 Aug 2020 14:54:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2406A100EBA4;
	Tue,  4 Aug 2020 14:54:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5C8F71809554;
	Tue,  4 Aug 2020 14:54:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 074Es2A0014459 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 4 Aug 2020 10:54:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8B2067179C; Tue,  4 Aug 2020 14:54:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from [192.168.1.10] (unknown [10.40.192.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D2E2471769;
	Tue,  4 Aug 2020 14:53:53 +0000 (UTC)
To: John Dorminy <jdorminy@redhat.com>, Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>, dm-devel@redhat.com
References: <20200731224645.89483-1-jdorminy@redhat.com>
From: Heinz Mauelshagen <heinzm@redhat.com>
Message-ID: <4f1d8377-6df2-ec1d-df1b-492d6a192468@redhat.com>
Date: Tue, 4 Aug 2020 16:53:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200731224645.89483-1-jdorminy@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] dm-ebs: Fix incorrect checking for
 REQ_OP_FLUSH.
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

Acked-by: Heinz Mauelshagen <heinzm@redhat.com>

On 8/1/20 12:46 AM, John Dorminy wrote:
> REQ_OP_FLUSH was being treated as a flag, but the operation
> part of bio->bi_opf must be treated as a whole. Change to
> accessing the operation part via bio_op(bio) and checking
> for equality.
>
> Signed-off-by: John Dorminy <jdorminy@redhat.com>
> ---
>   drivers/md/dm-ebs-target.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/md/dm-ebs-target.c b/drivers/md/dm-ebs-target.c
> index 44451276f128..cb85610527c2 100644
> --- a/drivers/md/dm-ebs-target.c
> +++ b/drivers/md/dm-ebs-target.c
> @@ -363,7 +363,7 @@ static int ebs_map(struct dm_target *ti, struct bio *bio)
>   	bio_set_dev(bio, ec->dev->bdev);
>   	bio->bi_iter.bi_sector = ec->start + dm_target_offset(ti, bio->bi_iter.bi_sector);
>   
> -	if (unlikely(bio->bi_opf & REQ_OP_FLUSH))
> +	if (unlikely(bio_op(bio) == REQ_OP_FLUSH))
>   		return DM_MAPIO_REMAPPED;
>   	/*
>   	 * Only queue for bufio processing in case of partial

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

