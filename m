Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 902DF55B430
	for <lists+dm-devel@lfdr.de>; Sun, 26 Jun 2022 23:37:46 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-qsaRFOVwM4eABVAJVxMWEw-1; Sun, 26 Jun 2022 17:37:43 -0400
X-MC-Unique: qsaRFOVwM4eABVAJVxMWEw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9B4F801233;
	Sun, 26 Jun 2022 21:37:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CAE492166B29;
	Sun, 26 Jun 2022 21:37:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 50EB6194B96A;
	Sun, 26 Jun 2022 21:37:30 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B1C2D1947040
 for <dm-devel@listman.corp.redhat.com>; Sun, 26 Jun 2022 21:37:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6C31B40CF8E5; Sun, 26 Jun 2022 21:37:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 67A534010150
 for <dm-devel@redhat.com>; Sun, 26 Jun 2022 21:37:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D02B1C05151
 for <dm-devel@redhat.com>; Sun, 26 Jun 2022 21:37:28 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-AxZU0IGtP-uITDa7mmd-eg-1; Sun, 26 Jun 2022 17:37:26 -0400
X-MC-Unique: AxZU0IGtP-uITDa7mmd-eg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0F7E960F63;
 Sun, 26 Jun 2022 21:37:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FB63C34114;
 Sun, 26 Jun 2022 21:37:24 +0000 (UTC)
Date: Sun, 26 Jun 2022 14:37:22 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ming Lei <ming.lei@redhat.com>
Message-ID: <YrjRkp9y99KZdwMo@sol.localdomain>
References: <20220624141255.2461148-1-ming.lei@redhat.com>
 <20220624141255.2461148-2-ming.lei@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220624141255.2461148-2-ming.lei@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jun 24, 2022 at 10:12:52PM +0800, Ming Lei wrote:
> diff --git a/block/blk-crypto.c b/block/blk-crypto.c
> index a496aaef85ba..caae2f429fc7 100644
> --- a/block/blk-crypto.c
> +++ b/block/blk-crypto.c
> @@ -134,6 +134,21 @@ void bio_crypt_dun_increment(u64 dun[BLK_CRYPTO_DUN_ARRAY_SIZE],
>  	}
>  }
>  
> +/* Decrements @dun by @dec, treating @dun as a multi-limb integer. */
> +void bio_crypt_dun_decrement(u64 dun[BLK_CRYPTO_DUN_ARRAY_SIZE],
> +			     unsigned int dec)
> +{
> +	int i;
> +
> +	for (i = 0; dec && i < BLK_CRYPTO_DUN_ARRAY_SIZE; i++) {
> +		dun[i] -= dec;
> +		if (dun[i] > inc)
> +			dec = 1;
> +		else
> +			dec = 0;
> +	}
> +}

This doesn't compile.  Also this doesn't handle underflow into the next limb
correctly.  A correct version would be:

		u64 prev = dun[i];

		dun[i] -= dec;
		if (dun[i] > prev)
			dec = 1;
		else
			dec = 0;

- Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

