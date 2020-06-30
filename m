Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 32B8220FB81
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jun 2020 20:15:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593540906;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7l0W+1jbcgK3Nj/+qWiVr/rMcurtlfURooeEas8fQQ4=;
	b=GDrXD8ywZurKbDTd5slmax+zVM5KRk/jXVru1/Y+CnjXbxbF3+mbQoENk8DiQyU1xSoEqD
	gOl/AwZs8AbwQsOYQTq3MbIhcekbVtnMwnbz0iDAykQcn628FXhdLRiWRtzOMKFO67lMvW
	lOfmxxi3LQqH+g3yhblK4vTnQoflyx0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-BDTV7WKYN8e2FdWtc7j_KA-1; Tue, 30 Jun 2020 14:15:03 -0400
X-MC-Unique: BDTV7WKYN8e2FdWtc7j_KA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03578464;
	Tue, 30 Jun 2020 18:14:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E8F0071667;
	Tue, 30 Jun 2020 18:14:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E7B751809547;
	Tue, 30 Jun 2020 18:14:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05UIEUwV027176 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 30 Jun 2020 14:14:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3289D5C1D0; Tue, 30 Jun 2020 18:14:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D88455C1B0;
	Tue, 30 Jun 2020 18:14:26 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 05UIEQQb009464; Tue, 30 Jun 2020 14:14:26 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 05UIEPPm009460; Tue, 30 Jun 2020 14:14:25 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Tue, 30 Jun 2020 14:14:25 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Eric Biggers <ebiggers@kernel.org>
In-Reply-To: <20200630175746.GA2026704@gmail.com>
Message-ID: <alpine.LRH.2.02.2006301414120.30526@file01.intranet.prod.int.rdu2.redhat.com>
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
	<20200630175746.GA2026704@gmail.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Tue, 30 Jun 2020, Eric Biggers wrote:

> On Tue, Jun 30, 2020 at 01:01:16PM -0400, Mikulas Patocka wrote:
> > > diff --git a/crypto/pcrypt.c b/crypto/pcrypt.c
> > > index 7240e8bbdebb..643f7f1cc91c 100644
> > > --- a/crypto/pcrypt.c
> > > +++ b/crypto/pcrypt.c
> > > @@ -232,12 +232,15 @@ static int pcrypt_create_aead(struct crypto_template *tmpl, struct rtattr **tb,
> > >  	struct crypto_attr_type *algt;
> > >  	struct aead_instance *inst;
> > >  	struct aead_alg *alg;
> > > +	u32 mask;
> > >  	int err;
> > >  
> > >  	algt = crypto_get_attr_type(tb);
> > >  	if (IS_ERR(algt))
> > >  		return PTR_ERR(algt);
> > >  
> > > +	mask = crypto_alg_inherited_mask(algt->type, algt->mask);
> > > +
> > >  	inst = kzalloc(sizeof(*inst) + sizeof(*ctx), GFP_KERNEL);
> > >  	if (!inst)
> > >  		return -ENOMEM;
> > > @@ -254,7 +257,7 @@ static int pcrypt_create_aead(struct crypto_template *tmpl, struct rtattr **tb,
> > >  		goto err_free_inst;
> > >  
> > >  	err = crypto_grab_aead(&ctx->spawn, aead_crypto_instance(inst),
> > > -			       crypto_attr_alg_name(tb[1]), 0, 0);
> > > +			       crypto_attr_alg_name(tb[1]), 0, mask);
> > >  	if (err)
> > >  		goto err_free_inst;
> > >  
> > 
> > I added "mask" there - but there is still a "mask" argument that is 
> > unused - is it a bug to have two "mask" variables?
> 
> Right, I didn't see that algt->type and algt->mask are already being passed to 
> pcrypt_create_aead().  It's redundant because pcrypt_create_aead() has access to
> those via crypto_get_attr_type() anyway.
> 
> How about just removing those two arguments for now?
> 
> - Eric

Yes.

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

