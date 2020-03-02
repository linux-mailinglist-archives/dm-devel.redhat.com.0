Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id DD05D175745
	for <lists+dm-devel@lfdr.de>; Mon,  2 Mar 2020 10:37:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583141847;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Ie9MleyzNpMF4Km1DcaRQa72ymG/JGMMUb1ndobaf2I=;
	b=UDL3ggnkB7W48drPM5HPCjcqSQ26OHbSncfirxtdzVXd/NBJwSFS8hp3MAVjbpR/psWfcr
	zVJ4BAkWJZrLVq20+aVZ+jBZWU9uyhjQRH+UrP1Rl/p47Htg2Fhw1IG8kh3o2GzjV2qUxZ
	vn/xNSUEmn6D2TezqOfLr67MIQwC0BY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-FCom2gp-O_2EVSnan5_mfQ-1; Mon, 02 Mar 2020 04:37:25 -0500
X-MC-Unique: FCom2gp-O_2EVSnan5_mfQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A258F108442D;
	Mon,  2 Mar 2020 09:37:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F04839E;
	Mon,  2 Mar 2020 09:37:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0CFAD18089C8;
	Mon,  2 Mar 2020 09:36:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0229ae1o021088 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 2 Mar 2020 04:36:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7A78C2026D67; Mon,  2 Mar 2020 09:36:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 74A282026D68
	for <dm-devel@redhat.com>; Mon,  2 Mar 2020 09:36:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2CD0800FF4
	for <dm-devel@redhat.com>; Mon,  2 Mar 2020 09:36:37 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr70043.outbound.protection.outlook.com [40.107.7.43]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-382-Jq_lij05P_eVtpOOry1Lzg-1; Mon, 02 Mar 2020 04:36:35 -0500
X-MC-Unique: Jq_lij05P_eVtpOOry1Lzg-1
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com (52.134.3.153) by
	VI1PR0402MB3552.eurprd04.prod.outlook.com (52.134.4.149) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2772.14; Mon, 2 Mar 2020 09:36:32 +0000
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com
	([fe80::751e:7e8d:ed4:ef5f]) by
	VI1PR0402MB3485.eurprd04.prod.outlook.com
	([fe80::751e:7e8d:ed4:ef5f%7]) with mapi id 15.20.2772.019;
	Mon, 2 Mar 2020 09:36:32 +0000
From: Horia Geanta <horia.geanta@nxp.com>
To: "Andrei Botila (OSS)" <andrei.botila@oss.nxp.com>, Aymen Sghaier
	<aymen.sghaier@nxp.com>, Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Thread-Topic: [PATCH] crypto: caam - update xts sector size for large input
	length
Thread-Index: AQHV7iR/GJR55F8brEiS/iBRq64oyA==
Date: Mon, 2 Mar 2020 09:36:32 +0000
Message-ID: <VI1PR0402MB34851CC70E092F598E9BF32298E70@VI1PR0402MB3485.eurprd04.prod.outlook.com>
References: <20200228104648.18898-1-andrei.botila@oss.nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [212.146.100.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 08c672b6-2a6c-40ec-4b0e-08d7be8d3158
x-ms-traffictypediagnostic: VI1PR0402MB3552:|VI1PR0402MB3552:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0402MB3552CEFBCD7A318E0B76120598E70@VI1PR0402MB3552.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 033054F29A
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(366004)(396003)(346002)(376002)(136003)(39860400002)(199004)(189003)(52536014)(5660300002)(2906002)(71200400001)(66946007)(91956017)(76116006)(66476007)(64756008)(66446008)(316002)(7696005)(66556008)(6506007)(33656002)(86362001)(54906003)(44832011)(478600001)(8936002)(26005)(186003)(9686003)(55016002)(8676002)(81166006)(4326008)(81156014)(53546011)(110136005);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB3552;
	H:VI1PR0402MB3485.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S55ul4zv80yDSkwHmggKjBbriz8wSUw4SjcjTmBz68pTJ+LVCkp7KyGTE91IWUEtE+bz1N81bk3WbGSB+Nf6Vv3nR67u8ny5Jxhqxw826bzsZktTIia8K1jsEO/0OyJzJCPGIUAHbCiunNtMCoItKb7rXLOUHuZ0z0FZw0Gnkc4XFW02a2eUPlVrG7FCKevfJ8AY7XcFrMFGFfuydG4PavqnGbO/dGrFBY50/V+nC6yTcSYEiMrI6ZcdEPwUkGFzdIwPRMlXfZJ0e/NbkziYgicrf8fFQqbmxzNI1gXy3RfbQvvzLOXVItfd3m5lRw0fk2nXsCRxAVCZ/Yt4Xtc7t+DbBomXq2FXqT3hM1ctr6K4TFfXgjLmJZv4DhunqeXbxGeRQV7oJe9PoFvLPIiLDMQIENgWN3ipadui+eBp/Ekfa+9f9s1rlU9dWAh0WmQf
x-ms-exchange-antispam-messagedata: b1gwwWdTlZ8bg0ArvcjwWU5oMshxsd7S4ISivJbECXX9L18NQcf6EzNvBxNXKBtQfOcP20cuh7OCYlhWxNhpxexChyd3Ey+pXU4YwslVzh/mt5utiX+43aRBVnntVDy4KaxqLDQ4+nfCqCRYXXQdLQ==
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08c672b6-2a6c-40ec-4b0e-08d7be8d3158
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2020 09:36:32.2781 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xRsThamCcsSl5TzGVxYY/M5O4+kbVgEhDN1kZrHVwAey91IpEapYnxKBI5Xt6d/vGSCCtXHO4K5f34qmLPv5Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3552
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0229ae1o021088
X-loop: dm-devel@redhat.com
Cc: Andrei Botila <andrei.botila@nxp.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [dm-devel] [PATCH] crypto: caam - update xts sector size for
 large input length
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

+ dm-devel

On 2/28/2020 12:47 PM, Andrei Botila (OSS) wrote:
> From: Andrei Botila <andrei.botila@nxp.com>
>=20
> Since in the software implementation of XTS-AES there is
> no notion of sector every input length is processed the same way.
> CAAM implementation has the notion of sector which causes different
> results between the software implementation and the one in CAAM
> for input lengths bigger than 512 bytes.
> Increase sector size to maximum value on 16 bits.
>=20
> Fixes: c6415a6016bf ("crypto: caam - add support for acipher xts(aes)")
> Cc: <stable@vger.kernel.org> # v4.12+
> Signed-off-by: Andrei Botila <andrei.botila@nxp.com>
Reviewed-by: Horia Geant=E3 <horia.geanta@nxp.com>

Thanks,
Horia

> ---
> This patch needs to be applied from v4.12+ because dm-crypt has added sup=
port
> for 4K sector size at that version. The commit was
> 8f0009a225171 ("dm-crypt: optionally support larger encryption sector siz=
e").
>=20
>  drivers/crypto/caam/caamalg_desc.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/crypto/caam/caamalg_desc.c b/drivers/crypto/caam/caa=
malg_desc.c
> index aa9ccca67045..8ebbbd28b1f7 100644
> --- a/drivers/crypto/caam/caamalg_desc.c
> +++ b/drivers/crypto/caam/caamalg_desc.c
> @@ -1518,7 +1518,13 @@ EXPORT_SYMBOL(cnstr_shdsc_skcipher_decap);
>   */
>  void cnstr_shdsc_xts_skcipher_encap(u32 * const desc, struct alginfo *cd=
ata)
>  {
> -=09__be64 sector_size =3D cpu_to_be64(512);
> +=09/*
> +=09 * Set sector size to a big value, practically disabling
> +=09 * sector size segmentation in xts implementation. We cannot
> +=09 * take full advantage of this HW feature with existing
> +=09 * crypto API / dm-crypt SW architecture.
> +=09 */
> +=09__be64 sector_size =3D cpu_to_be64(BIT(15));
>  =09u32 *key_jump_cmd;
> =20
>  =09init_sh_desc(desc, HDR_SHARE_SERIAL | HDR_SAVECTX);
> @@ -1571,7 +1577,13 @@ EXPORT_SYMBOL(cnstr_shdsc_xts_skcipher_encap);
>   */
>  void cnstr_shdsc_xts_skcipher_decap(u32 * const desc, struct alginfo *cd=
ata)
>  {
> -=09__be64 sector_size =3D cpu_to_be64(512);
> +=09/*
> +=09 * Set sector size to a big value, practically disabling
> +=09 * sector size segmentation in xts implementation. We cannot
> +=09 * take full advantage of this HW feature with existing
> +=09 * crypto API / dm-crypt SW architecture.
> +=09 */
> +=09__be64 sector_size =3D cpu_to_be64(BIT(15));
>  =09u32 *key_jump_cmd;
> =20
>  =09init_sh_desc(desc, HDR_SHARE_SERIAL | HDR_SAVECTX);
>=20




--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

