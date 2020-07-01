Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id B66D42101A5
	for <lists+dm-devel@lfdr.de>; Wed,  1 Jul 2020 03:50:54 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-31_q0hF3O7iMeDOW5UNvpA-1; Tue, 30 Jun 2020 21:50:51 -0400
X-MC-Unique: 31_q0hF3O7iMeDOW5UNvpA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24CE1107ACCD;
	Wed,  1 Jul 2020 01:50:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C58BA610F2;
	Wed,  1 Jul 2020 01:50:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6A50C6C9C3;
	Wed,  1 Jul 2020 01:50:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0611oGBe018278 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 30 Jun 2020 21:50:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 48C51217B43C; Wed,  1 Jul 2020 01:50:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31AD2217B439
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 01:50:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D3CA800883
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 01:50:14 +0000 (UTC)
Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-200-l2Q7KEKBPDaj9CZrKb2Rpw-1; Tue, 30 Jun 2020 21:50:12 -0400
X-MC-Unique: l2Q7KEKBPDaj9CZrKb2Rpw-1
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
	by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
	id 1jqRsU-0004tu-Eh; Wed, 01 Jul 2020 11:49:35 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
	Wed, 01 Jul 2020 11:49:34 +1000
Date: Wed, 1 Jul 2020 11:49:34 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20200701014934.GA6710@gondor.apana.org.au>
References: <alpine.LRH.2.02.2006261109520.11899@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2006261215480.13882@file01.intranet.prod.int.rdu2.redhat.com>
	<20200626164617.GA211634@gmail.com>
	<alpine.LRH.2.02.2006281505250.347@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2006300954150.15237@file01.intranet.prod.int.rdu2.redhat.com>
	<20200630163552.GA837@sol.localdomain>
	<alpine.LRH.2.02.2006301256110.30526@file01.intranet.prod.int.rdu2.redhat.com>
	<20200630175746.GA2026704@gmail.com>
	<alpine.LRH.2.02.2006301414120.30526@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2006301414580.30526@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2006301414580.30526@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <msnitzer@redhat.com>, Zaibo Xu <xuzaibo@huawei.com>,
	linux-kernel@vger.kernel.org, Wei Xu <xuwei5@hisilicon.com>,
	Eric Biggers <ebiggers@kernel.org>, dm-devel@redhat.com,
	George Cherian <gcherian@marvell.com>, linux-crypto@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	"David S. Miller" <davem@davemloft.net>, Milan Broz <mbroz@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/3 v6] crypto: introduce the flag
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Jun 30, 2020 at 02:15:55PM -0400, Mikulas Patocka wrote:
>
> Index: linux-2.6/crypto/pcrypt.c
> ===================================================================
> --- linux-2.6.orig/crypto/pcrypt.c	2020-06-29 16:03:07.346417000 +0200
> +++ linux-2.6/crypto/pcrypt.c	2020-06-30 20:11:56.636417000 +0200
> @@ -225,19 +225,21 @@ static int pcrypt_init_instance(struct c
>  	return 0;
>  }
>  
> -static int pcrypt_create_aead(struct crypto_template *tmpl, struct rtattr **tb,
> -			      u32 type, u32 mask)
> +static int pcrypt_create_aead(struct crypto_template *tmpl, struct rtattr **tb)
>  {

Rather than removing these two arguments, I think you should pass
along algt instead.

>  	struct pcrypt_instance_ctx *ctx;
>  	struct crypto_attr_type *algt;
>  	struct aead_instance *inst;
>  	struct aead_alg *alg;
> +	u32 mask;
>  	int err;
>  
>  	algt = crypto_get_attr_type(tb);
>  	if (IS_ERR(algt))
>  		return PTR_ERR(algt);

Then we could remove this bit.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

