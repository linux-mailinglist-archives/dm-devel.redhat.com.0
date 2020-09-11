Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 79FCC2685C8
	for <lists+dm-devel@lfdr.de>; Mon, 14 Sep 2020 09:25:42 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-JbQi7FlPPICM0szNPBwHew-1; Mon, 14 Sep 2020 03:25:39 -0400
X-MC-Unique: JbQi7FlPPICM0szNPBwHew-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14085809B66;
	Mon, 14 Sep 2020 07:25:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B1C741A268;
	Mon, 14 Sep 2020 07:25:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 147F51832FDB;
	Mon, 14 Sep 2020 07:25:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08BGeZRt017840 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 11 Sep 2020 12:40:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A94FF100616E; Fri, 11 Sep 2020 16:40:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A485910B7C54
	for <dm-devel@redhat.com>; Fri, 11 Sep 2020 16:40:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80F8C858289
	for <dm-devel@redhat.com>; Fri, 11 Sep 2020 16:40:33 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-81-9fjFbe72P1WhleK2vfqB_Q-1; 
	Fri, 11 Sep 2020 12:40:31 -0400
X-MC-Unique: 9fjFbe72P1WhleK2vfqB_Q-1
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
	[209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 4C192221ED
	for <dm-devel@redhat.com>; Fri, 11 Sep 2020 16:30:32 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id w25so7604807otk.8
	for <dm-devel@redhat.com>; Fri, 11 Sep 2020 09:30:32 -0700 (PDT)
X-Gm-Message-State: AOAM533j+I39jVt2/56EN7tO95r7dhYfeRMoXckeWyX/PY2flPFVRZHW
	2YNdlp3q5v0+QoVe3DYK5nqrF04+Q0m6eNKxO1o=
X-Google-Smtp-Source: ABdhPJwVQyk6DiS/IlLOx9LnZeVivdkhbwK1++Fv1w5oNIsTwqVE9VoM+lV6zKdwaEbZueGCBkqgp1dgM4WiQhFSqi0=
X-Received: by 2002:a9d:69c9:: with SMTP id v9mr1597523oto.90.1599841831517;
	Fri, 11 Sep 2020 09:30:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200911141103.14832-1-ardb@kernel.org>
	<CY4PR0401MB3652AD749C06D0ACD9F085F3C3240@CY4PR0401MB3652.namprd04.prod.outlook.com>
In-Reply-To: <CY4PR0401MB3652AD749C06D0ACD9F085F3C3240@CY4PR0401MB3652.namprd04.prod.outlook.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 11 Sep 2020 19:30:20 +0300
X-Gmail-Original-Message-ID: <CAMj1kXHOrGoGv6Tse9Vju9mTV_+ks8cUMqx_iSQHPfc+2DVkmw@mail.gmail.com>
Message-ID: <CAMj1kXHOrGoGv6Tse9Vju9mTV_+ks8cUMqx_iSQHPfc+2DVkmw@mail.gmail.com>
To: "Van Leeuwen, Pascal" <pvanleeuwen@rambus.com>, dm-devel@redhat.com,
	Milan Broz <gmazyland@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08BGeZRt017840
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 14 Sep 2020 03:23:33 -0400
Cc: "ebiggers@kernel.org" <ebiggers@kernel.org>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>
Subject: Re: [dm-devel] [PATCH] crypto: mark unused ciphers as obsolete
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
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

(cc Milan and dm-devel)

On Fri, 11 Sep 2020 at 19:24, Van Leeuwen, Pascal
<pvanleeuwen@rambus.com> wrote:
>
> > -----Original Message-----
> > From: linux-crypto-owner@vger.kernel.org <linux-crypto-owner@vger.kernel.org> On Behalf Of Ard Biesheuvel
> > Sent: Friday, September 11, 2020 4:11 PM
> > To: linux-crypto@vger.kernel.org
> > Cc: herbert@gondor.apana.org.au; ebiggers@kernel.org; Ard Biesheuvel <ardb@kernel.org>
> > Subject: [PATCH] crypto: mark unused ciphers as obsolete
> >
> > <<< External Email >>>
> > We have a few interesting pieces in our cipher museum, which are never
> > used internally, and were only ever provided as generic C implementations.
> >
> > Unfortunately, we cannot simply remove this code, as we cannot be sure
> > that it is not being used via the AF_ALG socket API, however unlikely.
> > So let's mark the Anubis, Khazad, SEED and TEA algorithms as obsolete,
> >
> Wouldn't the IKE deamon be able to utilize these algorithms through the XFRM API?
> I'm by no means an expert on the subject, but it looks like the cipher template is
> provided there directly via XFRM, so it does not need to live in the kernel source.
> And I know for a fact that SEED is being used for IPsec (and TLS) in Korea.
>

I have been staring at net/xfrm/xfrm_algo.c, and as far as I can tell,
algorithms have to be mentioned there in order to be usable. None of
the ciphers that this patch touches are listed there or anywhere else
in the kernel.

> The point being, there are more users to consider beyond "internal" (meaning hard
> coded in the kernel source in this context?) and AF_ALG.
>

That is a good point, actually, since dm-crypt could be affected here
as well, hence the CCs.

Milan (or others): are you aware of any of these ciphers being used
for dm-crypt?


> I'm not aware of any real use cases for Anubis, Khazad and TEA though.
>

OK, thanks for confirming. Removing those would be a good start.

> > which means they can only be enabled in the build if the socket API is
> > enabled in the first place.
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> > Hopefully, I will be able to convince the distro kernel maintainers to
> > disable CRYPTO_USER_API_ENABLE_OBSOLETE in their v5.10+ builds once the
> > iwd changes for arc4 make it downstream (Debian already has an updated
> > version in its unstable distro). With the joint coverage of their QA,
> > we should be able to confirm that these algos are never used, and
> > actually remove them altogether.
> >
> >  crypto/Kconfig | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/crypto/Kconfig b/crypto/Kconfig
> > index e85d8a059489..fac10143d23f 100644
> > --- a/crypto/Kconfig
> > +++ b/crypto/Kconfig
> > @@ -1185,6 +1185,7 @@ config CRYPTO_AES_PPC_SPE
> >
> >  config CRYPTO_ANUBIS
> >  tristate "Anubis cipher algorithm"
> > +depends on CRYPTO_USER_API_ENABLE_OBSOLETE
> >  select CRYPTO_ALGAPI
> >  help
> >    Anubis cipher algorithm.
> > @@ -1424,6 +1425,7 @@ config CRYPTO_FCRYPT
> >
> >  config CRYPTO_KHAZAD
> >  tristate "Khazad cipher algorithm"
> > +depends on CRYPTO_USER_API_ENABLE_OBSOLETE
> >  select CRYPTO_ALGAPI
> >  help
> >    Khazad cipher algorithm.
> > @@ -1487,6 +1489,7 @@ config CRYPTO_CHACHA_MIPS
> >
> >  config CRYPTO_SEED
> >  tristate "SEED cipher algorithm"
> > +depends on CRYPTO_USER_API_ENABLE_OBSOLETE
> >  select CRYPTO_ALGAPI
> >  help
> >    SEED cipher algorithm (RFC4269).
> > @@ -1613,6 +1616,7 @@ config CRYPTO_SM4
> >
> >  config CRYPTO_TEA
> >  tristate "TEA, XTEA and XETA cipher algorithms"
> > +depends on CRYPTO_USER_API_ENABLE_OBSOLETE
> >  select CRYPTO_ALGAPI
> >  help
> >    TEA cipher algorithm.
> > --
> > 2.17.1
>
> Regards,
> Pascal van Leeuwen
> Silicon IP Architect Multi-Protocol Engines, Rambus Security
> Rambus ROTW Holding BV
> +31-73 6581953
>
> Note: The Inside Secure/Verimatrix Silicon IP team was recently acquired by Rambus.
> Please be so kind to update your e-mail address book with my new e-mail address.
>
>
> ** This message and any attachments are for the sole use of the intended recipient(s). It may contain information that is confidential and privileged. If you are not the intended recipient of this message, you are prohibited from printing, copying, forwarding or saving it. Please delete the message and attachments and notify the sender immediately. **
>
> Rambus Inc.<http://www.rambus.com>


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

