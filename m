Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 16C122685D0
	for <lists+dm-devel@lfdr.de>; Mon, 14 Sep 2020 09:26:52 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-wr_jHrI5OFqkeGdvb_HzUA-1; Mon, 14 Sep 2020 03:26:49 -0400
X-MC-Unique: wr_jHrI5OFqkeGdvb_HzUA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D72C51007B22;
	Mon, 14 Sep 2020 07:26:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B31A660F96;
	Mon, 14 Sep 2020 07:26:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5E7788C7BF;
	Mon, 14 Sep 2020 07:26:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08BGkS0p018552 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 11 Sep 2020 12:46:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 54E0C201828C; Fri, 11 Sep 2020 16:46:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4EDCD2026F94
	for <dm-devel@redhat.com>; Fri, 11 Sep 2020 16:46:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E64490638F
	for <dm-devel@redhat.com>; Fri, 11 Sep 2020 16:46:26 +0000 (UTC)
Received: from us-smtp-delivery-148.mimecast.com
	(us-smtp-delivery-215.mimecast.com [216.205.24.215]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-443-_MG8jBE_M4e2Oa4xliQmCA-1;
	Fri, 11 Sep 2020 12:46:22 -0400
X-MC-Unique: _MG8jBE_M4e2Oa4xliQmCA-1
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
	(mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-117-6DmqudOPMoK4OQCqA19uVw-1; Fri, 11 Sep 2020 12:46:21 -0400
X-MC-Unique: 6DmqudOPMoK4OQCqA19uVw-1
Received: from CY4PR0401MB3652.namprd04.prod.outlook.com
	(2603:10b6:910:8a::27) by CY4PR04MB0903.namprd04.prod.outlook.com
	(2603:10b6:910:57::18) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15;
	Fri, 11 Sep 2020 16:46:18 +0000
Received: from CY4PR0401MB3652.namprd04.prod.outlook.com
	([fe80::bd2c:886:bd40:f40d]) by
	CY4PR0401MB3652.namprd04.prod.outlook.com
	([fe80::bd2c:886:bd40:f40d%5]) with mapi id 15.20.3370.017;
	Fri, 11 Sep 2020 16:46:18 +0000
From: "Van Leeuwen, Pascal" <pvanleeuwen@rambus.com>
To: Ard Biesheuvel <ardb@kernel.org>, "dm-devel@redhat.com"
	<dm-devel@redhat.com>, Milan Broz <gmazyland@gmail.com>
Thread-Topic: [PATCH] crypto: mark unused ciphers as obsolete
Thread-Index: AQHWiFRjVQhCDl0wBUmciifAeSWwvaljnRFwgAAD9ACAAASTgA==
Date: Fri, 11 Sep 2020 16:46:18 +0000
Message-ID: <CY4PR0401MB36522379F8C5AB02D848AAADC3240@CY4PR0401MB3652.namprd04.prod.outlook.com>
References: <20200911141103.14832-1-ardb@kernel.org>
	<CY4PR0401MB3652AD749C06D0ACD9F085F3C3240@CY4PR0401MB3652.namprd04.prod.outlook.com>
	<CAMj1kXHOrGoGv6Tse9Vju9mTV_+ks8cUMqx_iSQHPfc+2DVkmw@mail.gmail.com>
In-Reply-To: <CAMj1kXHOrGoGv6Tse9Vju9mTV_+ks8cUMqx_iSQHPfc+2DVkmw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [159.100.118.162]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8a279390-c94e-40a5-b18b-08d8567234e1
x-ms-traffictypediagnostic: CY4PR04MB0903:
x-microsoft-antispam-prvs: <CY4PR04MB0903CF3AA48C84B2982CD2A6C3240@CY4PR04MB0903.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aUxj+vnPu4T5/qvO4sVNOk6lopFj1sFprxyiczPYk5arnVV/6O3r+3zkIAtbIUxl9tlA+cjxB/0d1Z1PRPrdAaQ325cGyc4p7TdIGypjfAKeR2xqzQbWdJKkmhAQP9A4+z9ZMVwjO2O9cxor1qcU5kOxMQRcqsIVo+oGqkrRKO5xSS1ogUk+dFN8W0K4EQyWkl0J1tCDWHcS0y1nY04sAIMdM8XrMAKy5Elc7xFfQLxKNuSVQ/Lem+g9f7yy2opZiHx7lAtI+rO4vppcU2EKdOV9wWhK5dJYGAhmbxAps41ryyW5yjsRlH3iOa8tuWuE31Xx6FqS/FnFAeDG3iqJhklU8B0cnTW43fiDyiRYYDI8tzfDNUAKw83lozxQfBQivuph2hKwEXcOiAURcSI13Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR0401MB3652.namprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(136003)(396003)(346002)(376002)(39850400004)(366004)(64756008)(55016002)(5660300002)(66946007)(76116006)(66476007)(110136005)(66556008)(66446008)(9686003)(54906003)(186003)(83380400001)(316002)(86362001)(33656002)(8936002)(52536014)(71200400001)(26005)(53546011)(7696005)(478600001)(6506007)(4326008)(8676002)(2906002);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: gbF1y3fsIi3WLudkA+AUbzLwcki10/Ic9R8q0eTZo0z4inNHD7XJTHI11h9l3qvdce+I3AbibFokQJsK/lKJxzxto1DYEEVUp/A5RSi9KwyU9tIsG7hO8lCKLvq3df2hUkPa8YBfpuMTSqxAKU9nDjDTqHR6Ax7Xis1IsR13TFqUPCp7a2FRCGsoHovUAFLHe21cUfE1TrK3g7PwoT889k/WeL7+c6HyIaL50ZnauJpc87jzRfZGAcWFgzIXlLjkt8aWed0Wsxh8D4hs8PobIrKOhFoT3ybSREFKN1DnR5/3gXjAcRhWojK0ckr3C7MaTcD+Dkcu19FM69YQLdUiHi46/WofYlYNAV/AORjfE7hteMfnORa11ow/lTx7X0XoLZZQieZUmpZ7ocnp9zXcB1dofpn01iMz+VGIaCi7ZcSNCqCitdhJ150R3WIn7aMRPaBidF/StnfM05WamwmrKRFqlAeUjzBrh5lacNFY7DotXJeWUo9eyI/aH127ou18APWa058uZWKc8zAglvadWtakaoqI0Fxbg5LMmyWOEc8aUvuz3nBpSKQE0XS2KUHpgHG+qZ6WP4ljfaCiIqzGk1i6h+E9XYRYKZVqpTgQanmvYQbf+mQ1HVRYZeq5v6+gEmTSrEUZOop9+3zy17yAsw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: rambus.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR0401MB3652.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a279390-c94e-40a5-b18b-08d8567234e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2020 16:46:18.4722 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bd0ba799-c2b9-413c-9c56-5d1731c4827c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KVVUZboGy2UxvT1NAW/r3PohkBflgzbqZsIZQTvij7TcGW2B1eolUF65gxm2v2twtpN+Vrg1FZsNYnAFcY3yqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0903
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08BGkS0p018552
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.004
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-US

> -----Original Message-----
> From: Ard Biesheuvel <ardb@kernel.org>
> Sent: Friday, September 11, 2020 6:30 PM
> To: Van Leeuwen, Pascal <pvanleeuwen@rambus.com>; dm-devel@redhat.com; Milan Broz <gmazyland@gmail.com>
> Cc: linux-crypto@vger.kernel.org; herbert@gondor.apana.org.au; ebiggers@kernel.org
> Subject: Re: [PATCH] crypto: mark unused ciphers as obsolete
>
> <<< External Email >>>
> (cc Milan and dm-devel)
>
> On Fri, 11 Sep 2020 at 19:24, Van Leeuwen, Pascal
> <pvanleeuwen@rambus.com> wrote:
> >
> > > -----Original Message-----
> > > From: linux-crypto-owner@vger.kernel.org <linux-crypto-owner@vger.kernel.org> On Behalf Of Ard Biesheuvel
> > > Sent: Friday, September 11, 2020 4:11 PM
> > > To: linux-crypto@vger.kernel.org
> > > Cc: herbert@gondor.apana.org.au; ebiggers@kernel.org; Ard Biesheuvel <ardb@kernel.org>
> > > Subject: [PATCH] crypto: mark unused ciphers as obsolete
> > >
> > > <<< External Email >>>
> > > We have a few interesting pieces in our cipher museum, which are never
> > > used internally, and were only ever provided as generic C implementations.
> > >
> > > Unfortunately, we cannot simply remove this code, as we cannot be sure
> > > that it is not being used via the AF_ALG socket API, however unlikely.
> > > So let's mark the Anubis, Khazad, SEED and TEA algorithms as obsolete,
> > >
> > Wouldn't the IKE deamon be able to utilize these algorithms through the XFRM API?
> > I'm by no means an expert on the subject, but it looks like the cipher template is
> > provided there directly via XFRM, so it does not need to live in the kernel source.
> > And I know for a fact that SEED is being used for IPsec (and TLS) in Korea.
> >
>
> I have been staring at net/xfrm/xfrm_algo.c, and as far as I can tell,
> algorithms have to be mentioned there in order to be usable. None of
> the ciphers that this patch touches are listed there or anywhere else
> in the kernel.
>
Hmmm ... good point. Wasn't aware XFRM was actively allowing only a subset.
Actually found this commented out code in my Pluto source (kernel_netlink.c):

/*
 * Not yet implemented in Linux kernel xfrm_algo.c
{ SADB_X_EALG_SEEDCBC, "cbc(seed)" },
 */

Go figure.

> > The point being, there are more users to consider beyond "internal" (meaning hard
> > coded in the kernel source in this context?) and AF_ALG.
> >
>
> That is a good point, actually, since dm-crypt could be affected here
> as well, hence the CCs.
>
> Milan (or others): are you aware of any of these ciphers being used
> for dm-crypt?
>
>
> > I'm not aware of any real use cases for Anubis, Khazad and TEA though.
> >
>
> OK, thanks for confirming. Removing those would be a good start.
>
> > > which means they can only be enabled in the build if the socket API is
> > > enabled in the first place.
> > >
> > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > > ---
> > > Hopefully, I will be able to convince the distro kernel maintainers to
> > > disable CRYPTO_USER_API_ENABLE_OBSOLETE in their v5.10+ builds once the
> > > iwd changes for arc4 make it downstream (Debian already has an updated
> > > version in its unstable distro). With the joint coverage of their QA,
> > > we should be able to confirm that these algos are never used, and
> > > actually remove them altogether.
> > >
> > >  crypto/Kconfig | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/crypto/Kconfig b/crypto/Kconfig
> > > index e85d8a059489..fac10143d23f 100644
> > > --- a/crypto/Kconfig
> > > +++ b/crypto/Kconfig
> > > @@ -1185,6 +1185,7 @@ config CRYPTO_AES_PPC_SPE
> > >
> > >  config CRYPTO_ANUBIS
> > >  tristate "Anubis cipher algorithm"
> > > +depends on CRYPTO_USER_API_ENABLE_OBSOLETE
> > >  select CRYPTO_ALGAPI
> > >  help
> > >    Anubis cipher algorithm.
> > > @@ -1424,6 +1425,7 @@ config CRYPTO_FCRYPT
> > >
> > >  config CRYPTO_KHAZAD
> > >  tristate "Khazad cipher algorithm"
> > > +depends on CRYPTO_USER_API_ENABLE_OBSOLETE
> > >  select CRYPTO_ALGAPI
> > >  help
> > >    Khazad cipher algorithm.
> > > @@ -1487,6 +1489,7 @@ config CRYPTO_CHACHA_MIPS
> > >
> > >  config CRYPTO_SEED
> > >  tristate "SEED cipher algorithm"
> > > +depends on CRYPTO_USER_API_ENABLE_OBSOLETE
> > >  select CRYPTO_ALGAPI
> > >  help
> > >    SEED cipher algorithm (RFC4269).
> > > @@ -1613,6 +1616,7 @@ config CRYPTO_SM4
> > >
> > >  config CRYPTO_TEA
> > >  tristate "TEA, XTEA and XETA cipher algorithms"
> > > +depends on CRYPTO_USER_API_ENABLE_OBSOLETE
> > >  select CRYPTO_ALGAPI
> > >  help
> > >    TEA cipher algorithm.
> > > --
> > > 2.17.1
> >
> > Regards,
> > Pascal van Leeuwen
> > Silicon IP Architect Multi-Protocol Engines, Rambus Security
> > Rambus ROTW Holding BV
> > +31-73 6581953
> >
> > Note: The Inside Secure/Verimatrix Silicon IP team was recently acquired by Rambus.
> > Please be so kind to update your e-mail address book with my new e-mail address.
> >
> >
> > ** This message and any attachments are for the sole use of the intended recipient(s). It may contain information that is
> confidential and privileged. If you are not the intended recipient of this message, you are prohibited from printing, copying,
> forwarding or saving it. Please delete the message and attachments and notify the sender immediately. **
> >
> > Rambus Inc.<http://www.rambus.com>

Regards,
Pascal van Leeuwen
Silicon IP Architect Multi-Protocol Engines, Rambus Security
Rambus ROTW Holding BV
+31-73 6581953

Note: The Inside Secure/Verimatrix Silicon IP team was recently acquired by Rambus.
Please be so kind to update your e-mail address book with my new e-mail address.


** This message and any attachments are for the sole use of the intended recipient(s). It may contain information that is confidential and privileged. If you are not the intended recipient of this message, you are prohibited from printing, copying, forwarding or saving it. Please delete the message and attachments and notify the sender immediately. **

Rambus Inc.<http://www.rambus.com>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

