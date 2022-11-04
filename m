Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A90619212
	for <lists+dm-devel@lfdr.de>; Fri,  4 Nov 2022 08:33:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667547183;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JvsdnfOpWOvH8uUr1adqKP9b50M1FIlyas98ChCgZt8=;
	b=fsM7hq2S2Mw//JAUSRv7VSvRYYV25tOGfnuJeZs+vU6Zmeomv2Y42VlplTfIHMijcvZEs5
	zjULPiDtnf9RJgXSP4uHQ5I9U0U0iIDkahmlfNYhNgIh1hfrxUkYKYcDMxriVSG2ZsM5kG
	2XbTmdAPPmAHtPUnuNrzHBk6nd4dDiE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-ErMJmYcyOGyOzhmSHK4hvg-1; Fri, 04 Nov 2022 03:32:58 -0400
X-MC-Unique: ErMJmYcyOGyOzhmSHK4hvg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B290E101A56D;
	Fri,  4 Nov 2022 07:32:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9C0274024BC9;
	Fri,  4 Nov 2022 07:32:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6F9DD1946A46;
	Fri,  4 Nov 2022 07:32:56 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DEDBB1946594
 for <dm-devel@listman.corp.redhat.com>; Fri,  4 Nov 2022 07:32:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CEBCD1121325; Fri,  4 Nov 2022 07:32:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C788F1121320
 for <dm-devel@redhat.com>; Fri,  4 Nov 2022 07:32:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ACD61833A06
 for <dm-devel@redhat.com>; Fri,  4 Nov 2022 07:32:54 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-Fdn1noBJNL2CEdxr2DHPgw-1; Fri, 04 Nov 2022 03:32:52 -0400
X-MC-Unique: Fdn1noBJNL2CEdxr2DHPgw-1
Received: by verein.lst.de (Postfix, from userid 2407)
 id A135F68BFE; Fri,  4 Nov 2022 08:32:49 +0100 (CET)
Date: Fri, 4 Nov 2022 08:32:49 +0100
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20221104073249.GB18231@lst.de>
References: <20221104054621.628369-1-hch@lst.de>
 <20221104054621.628369-3-hch@lst.de> <Y2S927PXuEYM7xwJ@sol.localdomain>
MIME-Version: 1.0
In-Reply-To: <Y2S927PXuEYM7xwJ@sol.localdomain>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [dm-devel] [PATCH 2/2] blk-crypto: add a
 blk_crypto_cfg_supported helper
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
Cc: Jens Axboe <axboe@kernel.dk>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 Mike Snitzer <snitzer@kernel.org>, linux-fscrypt@vger.kernel.org,
 linux-block@vger.kernel.org, dm-devel@redhat.com,
 Jaegeuk Kim <jaegeuk@kernel.org>, Christoph Hellwig <hch@lst.de>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 04, 2022 at 12:23:07AM -0700, Eric Biggers wrote:
> > +bool blk_crypto_cfg_supported(struct block_device *bdev,
> > +			      const struct blk_crypto_config *cfg)
> > +{
> > +	return __blk_crypto_cfg_supported(bdev_get_queue(bdev)->crypto_profile,
> > +					  cfg);
> > +}
> 
> I think this part is too confusing, because there's already a function
> blk_crypto_config_supported() which does something slightly different.
> 
> How about calling this blk_crypto_config_supported_natively() instead?  It's
> kind of long, but it's much clearer.

Fine with me.

> Also, it should be defined in blk-crypto.c, next to
> blk_crypto_config_supported(), and not in blk-crypto-profile.c.
> (And declared in blk-crypto.h, not blk-crypto-profile.h.)

Ok.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

