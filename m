Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5679D55B840
	for <lists+dm-devel@lfdr.de>; Mon, 27 Jun 2022 09:38:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656315481;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7hNAhqX/dIr4xPGDZBKbkQWvPT27RvB7peUVx+JNTSc=;
	b=WxZUV9SMbWfxqw6JNXiUtnv2wWFfUf3EJe+ReiFuf2iei9qIdiuCAHjyw7aKJHLY16n0Mi
	Kig3H5rfcGWBYYY8pAETx/PJ/V6NRemkvSQhg9nawazAi2aXWKG43R+8ODuWwSKM2tM5mA
	p7cy4ZvXyh/BE25Tqgk3SWet+TOryvQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-115-Vatlj-d4PcOzj5rvSl7cJw-1; Mon, 27 Jun 2022 03:37:57 -0400
X-MC-Unique: Vatlj-d4PcOzj5rvSl7cJw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ACE678032F2;
	Mon, 27 Jun 2022 07:37:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5DAFA40D2972;
	Mon, 27 Jun 2022 07:37:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E60AF1947052;
	Mon, 27 Jun 2022 07:37:53 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5B65119466DF
 for <dm-devel@listman.corp.redhat.com>; Mon, 27 Jun 2022 07:37:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 424A14035783; Mon, 27 Jun 2022 07:37:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-8-31.pek2.redhat.com [10.72.8.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C983400F8FD;
 Mon, 27 Jun 2022 07:37:46 +0000 (UTC)
Date: Mon, 27 Jun 2022 15:37:41 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YrleRWRHyvebl6+e@T590>
References: <20220624141255.2461148-1-ming.lei@redhat.com>
 <20220624141255.2461148-2-ming.lei@redhat.com>
 <YrjRkp9y99KZdwMo@sol.localdomain>
MIME-Version: 1.0
In-Reply-To: <YrjRkp9y99KZdwMo@sol.localdomain>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: Re: [dm-devel] [PATCH 5.20 1/4] block: add bio_rewind() API
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 linux-block@vger.kernel.org, dm-devel@redhat.com,
 Dmitry Monakhov <dmonakhov@openvz.org>,
 Kent Overstreet <kent.overstreet@gmail.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Jun 26, 2022 at 02:37:22PM -0700, Eric Biggers wrote:
> On Fri, Jun 24, 2022 at 10:12:52PM +0800, Ming Lei wrote:
> > diff --git a/block/blk-crypto.c b/block/blk-crypto.c
> > index a496aaef85ba..caae2f429fc7 100644
> > --- a/block/blk-crypto.c
> > +++ b/block/blk-crypto.c
> > @@ -134,6 +134,21 @@ void bio_crypt_dun_increment(u64 dun[BLK_CRYPTO_DUN_ARRAY_SIZE],
> >  	}
> >  }
> >  
> > +/* Decrements @dun by @dec, treating @dun as a multi-limb integer. */
> > +void bio_crypt_dun_decrement(u64 dun[BLK_CRYPTO_DUN_ARRAY_SIZE],
> > +			     unsigned int dec)
> > +{
> > +	int i;
> > +
> > +	for (i = 0; dec && i < BLK_CRYPTO_DUN_ARRAY_SIZE; i++) {
> > +		dun[i] -= dec;
> > +		if (dun[i] > inc)
> > +			dec = 1;
> > +		else
> > +			dec = 0;
> > +	}
> > +}
> 
> This doesn't compile.  Also this doesn't handle underflow into the next limb
> correctly.  A correct version would be:
> 
> 		u64 prev = dun[i];
> 
> 		dun[i] -= dec;
> 		if (dun[i] > prev)
> 			dec = 1;
> 		else
> 			dec = 0;

You are right, thanks for the review!

Thanks,
Ming
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

