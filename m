Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id C34D420FB30
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jun 2020 19:58:33 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-jIGds7glO1KsEBRKaX3HFQ-1; Tue, 30 Jun 2020 13:58:29 -0400
X-MC-Unique: jIGds7glO1KsEBRKaX3HFQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 720281800D42;
	Tue, 30 Jun 2020 17:58:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B1F42289B5;
	Tue, 30 Jun 2020 17:58:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E2AC46C9C3;
	Tue, 30 Jun 2020 17:58:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05UHvv3N025648 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 30 Jun 2020 13:57:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D26D811796C2; Tue, 30 Jun 2020 17:57:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE26411796C0
	for <dm-devel@redhat.com>; Tue, 30 Jun 2020 17:57:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2E5118A6664
	for <dm-devel@redhat.com>; Tue, 30 Jun 2020 17:57:55 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-270-2b3F5ouYMuWL9iJR8orJHA-1;
	Tue, 30 Jun 2020 13:57:50 -0400
X-MC-Unique: 2b3F5ouYMuWL9iJR8orJHA-1
Received: from gmail.com (unknown [104.132.1.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 4368520724;
	Tue, 30 Jun 2020 17:57:48 +0000 (UTC)
Date: Tue, 30 Jun 2020 10:57:46 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20200630175746.GA2026704@gmail.com>
References: <alpine.LRH.2.02.2006171107220.18714@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2006171108440.18714@file01.intranet.prod.int.rdu2.redhat.com>
	<20200626044534.GA2870@gondor.apana.org.au>
	<alpine.LRH.2.02.2006261109520.11899@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2006261215480.13882@file01.intranet.prod.int.rdu2.redhat.com>
	<20200626164617.GA211634@gmail.com>
	<alpine.LRH.2.02.2006281505250.347@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2006300954150.15237@file01.intranet.prod.int.rdu2.redhat.com>
	<20200630163552.GA837@sol.localdomain>
	<alpine.LRH.2.02.2006301256110.30526@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2006301256110.30526@file01.intranet.prod.int.rdu2.redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <msnitzer@redhat.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Zaibo Xu <xuzaibo@huawei.com>, linux-kernel@vger.kernel.org,
	Wei Xu <xuwei5@hisilicon.com>, dm-devel@redhat.com,
	George Cherian <gcherian@marvell.com>, linux-crypto@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	"David S. Miller" <davem@davemloft.net>, Milan Broz <mbroz@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/3 v4] crypto: introduce the flag
 CRYPTO_ALG_ALLOCATES_MEMORY
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Jun 30, 2020 at 01:01:16PM -0400, Mikulas Patocka wrote:
> > diff --git a/crypto/pcrypt.c b/crypto/pcrypt.c
> > index 7240e8bbdebb..643f7f1cc91c 100644
> > --- a/crypto/pcrypt.c
> > +++ b/crypto/pcrypt.c
> > @@ -232,12 +232,15 @@ static int pcrypt_create_aead(struct crypto_template *tmpl, struct rtattr **tb,
> >  	struct crypto_attr_type *algt;
> >  	struct aead_instance *inst;
> >  	struct aead_alg *alg;
> > +	u32 mask;
> >  	int err;
> >  
> >  	algt = crypto_get_attr_type(tb);
> >  	if (IS_ERR(algt))
> >  		return PTR_ERR(algt);
> >  
> > +	mask = crypto_alg_inherited_mask(algt->type, algt->mask);
> > +
> >  	inst = kzalloc(sizeof(*inst) + sizeof(*ctx), GFP_KERNEL);
> >  	if (!inst)
> >  		return -ENOMEM;
> > @@ -254,7 +257,7 @@ static int pcrypt_create_aead(struct crypto_template *tmpl, struct rtattr **tb,
> >  		goto err_free_inst;
> >  
> >  	err = crypto_grab_aead(&ctx->spawn, aead_crypto_instance(inst),
> > -			       crypto_attr_alg_name(tb[1]), 0, 0);
> > +			       crypto_attr_alg_name(tb[1]), 0, mask);
> >  	if (err)
> >  		goto err_free_inst;
> >  
> 
> I added "mask" there - but there is still a "mask" argument that is 
> unused - is it a bug to have two "mask" variables?

Right, I didn't see that algt->type and algt->mask are already being passed to 
pcrypt_create_aead().  It's redundant because pcrypt_create_aead() has access to
those via crypto_get_attr_type() anyway.

How about just removing those two arguments for now?

- Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

