Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id C64D6157D87
	for <lists+dm-devel@lfdr.de>; Mon, 10 Feb 2020 15:39:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581345565;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oLfhdGWSI1uS3aRWJF+AXhBkZSjS92dUgN6JomvZGyE=;
	b=J2f1LHq1DxPsJWNv36UEXhuc3o7IGuvcde8rD3+9U8KwRo4NevqBy5Ds0g13LVLbC2RbtR
	3BKMFXV/t+r1U3BUqLdUhYIA9p8tHK53lrN3/T2z5CqdyOD3M9AD9CspUvSmpZ88fqoPgn
	+lNBk+VfYnssHwnEhag3TPB90l6Z26I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-mUHVWw5vMe2xy-R9L-w2wg-1; Mon, 10 Feb 2020 09:39:23 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F7B21088381;
	Mon, 10 Feb 2020 14:39:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED56C5D9CA;
	Mon, 10 Feb 2020 14:39:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BB3488B2A1;
	Mon, 10 Feb 2020 14:39:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01AEaBa7018609 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 10 Feb 2020 09:36:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 024672026D69; Mon, 10 Feb 2020 14:36:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EFEDC2063209
	for <dm-devel@redhat.com>; Mon, 10 Feb 2020 14:36:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C6F41185B0A6
	for <dm-devel@redhat.com>; Mon, 10 Feb 2020 14:36:08 +0000 (UTC)
Received: from m9a0014g.houston.softwaregrp.com
	(m9a0014g.houston.softwaregrp.com [15.124.64.90]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-70-pr6l4V7BNiuRJ21Sllzmgg-1;
	Mon, 10 Feb 2020 09:36:06 -0500
Received: FROM m9a0014g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0014g.houston.softwaregrp.com WITH ESMTP; 
	Mon, 10 Feb 2020 14:35:00 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Mon, 10 Feb 2020 14:35:14 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (15.124.72.13) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Mon, 10 Feb 2020 14:35:14 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com (10.175.223.16) by
	DM5PR18MB1435.namprd18.prod.outlook.com (10.173.211.136) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2707.23; Mon, 10 Feb 2020 14:35:12 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::946a:bcb6:670b:8e86]) by
	DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::946a:bcb6:670b:8e86%12]) with mapi id 15.20.2707.028;
	Mon, 10 Feb 2020 14:35:12 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH v2 08/17] libmultipath: fix sgio_get_vpd looping
Thread-Index: AQHV3FZO6Yk7Dw2g2UOlvG6TWPWgbagUhleA
Date: Mon, 10 Feb 2020 14:35:12 +0000
Message-ID: <03bc5ce5223641d1d4002d3e673cdbf894c01e91.camel@suse.com>
References: <1580929100-32572-1-git-send-email-bmarzins@redhat.com>
	<1580929100-32572-9-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1580929100-32572-9-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.218.227.247]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 417076ab-faa4-4f8b-5bd8-08d7ae367006
x-ms-traffictypediagnostic: DM5PR18MB1435:
x-microsoft-antispam-prvs: <DM5PR18MB14355ABDD686D12F5031CCF6FC190@DM5PR18MB1435.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 03094A4065
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(366004)(136003)(376002)(346002)(396003)(39860400002)(189003)(199004)(6506007)(4326008)(26005)(6512007)(186003)(36756003)(110136005)(71200400001)(81166006)(81156014)(6486002)(8936002)(5660300002)(316002)(86362001)(2616005)(8676002)(2906002)(478600001)(64756008)(66556008)(66446008)(66946007)(76116006)(66476007)(66574012)(91956017);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB1435;
	H:DM5PR18MB1355.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9dZWHZbUjHGwt2UBGrAWyt3OZR2HiikMWL8nr0V+PCqpygzMqpAu5umbRYdkmDA0slwjDUgXxiBXk4XVoeFIcE4I2YLOxDaAfJ9rr73fpcaFvaXnYlDrKlo63Blauvp7SIuGXN23r/1IZEJRPKCINuAtiRM/LxWMe0F1R29J+HRopgwLEEQmbP2h/tz9RtSCBgaheBZSFOEn2wUVFgupxTxPbACu5q5KPS1tXewNsfGLDFBrL94zVBSNVBml5KZtlV7A3G2HOhZh4Np757PZtE3fsDXjv2lLdoJ43XI/SK8dWr1mJfudjxtEhs5o5+NgIM/JQuFFmU4MgKDiqGq6+dtT34uCfZmC/OLcjhVM1WeD7/ksMDPrN9L33CSYgaucX+ssxGwj6Xp4Ph8Ua1nTLLKoS532Hd2RPFDNQYyPE2V3DByBzkK4nHy+AfjAUmX+
x-ms-exchange-antispam-messagedata: klzQSKYoo+ImI6L6521ESIDwBqJFTBclTX/DjisBGC7D9HMJv2gsI7Br9MS6JCso8ubMXQ/5eBbJ/v2Cqdeh4ISGtp36aqTSWe4tJt8D1/0FfdBC3JiXvRsBPAARFxJ9FPFr2TokVUe9iixYFksrkA==
x-ms-exchange-transport-forked: True
Content-ID: <83F00B447B88C24CBB6743317ABDD8B2@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 417076ab-faa4-4f8b-5bd8-08d7ae367006
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2020 14:35:12.5307 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ku/cgenihTmjHz2WYXmIpsTalLrxwQVyLuVjJ3hUvOx5uPoAC2EKNpLH3iZAYkmoF9fTxINUfA/QMPDg9xWmxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB1435
X-OriginatorOrg: suse.com
X-MC-Unique: pr6l4V7BNiuRJ21Sllzmgg-1
X-MC-Unique: mUHVWw5vMe2xy-R9L-w2wg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01AEaBa7018609
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH v2 08/17] libmultipath: fix sgio_get_vpd
	looping
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-02-05 at 12:58 -0600, Benjamin Marzinski wrote:
> If do_inq returns a page with a length that is less than maxlen, but
> larger than DEFAULT_SGIO_LEN, this function will loop forever. Also
> if do_inq returns with a length equal to or greater than maxlen,
> sgio_get_vpd will exit immediately, even if it hasn't read the entire
> page.  Fix these issues, modify the tests to verify the new behavior.
>=20
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/discovery.c | 12 +++----
>  tests/vpd.c              | 77 ++++++++++++++++++++++++------------
> ----
>  2 files changed, 52 insertions(+), 37 deletions(-)
>=20
>=20
> diff --git a/tests/vpd.c b/tests/vpd.c
> index d9f80eaa..1e653ed4 100644
> --- a/tests/vpd.c
> +++ b/tests/vpd.c
> \
> @@ -518,10 +519,16 @@ static void test_vpd_eui_ ## len ## _ ##
> wlen(void **state)             \
> =09\
>  =09n =3D create_vpd83(vt->vpdbuf, sizeof(vt->vpdbuf), test_id,=09\
>  =09=09=09 2, 0, len);=09=09=09=09=09\
> +=09if (sml) {=09=09=09=09=09=09=09\
> +=09=09/* overwrite the page side to DEFAULT_SGIO_LEN + 1 */=09\
> +=09=09put_unaligned_be16(255, vt->vpdbuf + 2);=09=09\
> +=09=09will_return(__wrap_ioctl, n);=09=09=09=09\
> +=09=09will_return(__wrap_ioctl, vt->vpdbuf);=09=09=09\
> +=09}=09=09=09=09=09=09=09=09\
>  =09will_return(__wrap_ioctl, n);=09=09=09=09=09\
>  =09will_return(__wrap_ioctl, vt->vpdbuf);=09=09=09=09

Nitpick:=20
1. "side" -> "size"
2. This looks like a missing "else" clause, even though it is not
(because get_vpd_sgio will make 2nd ioctl call). Perhaps add a comment
explaining that.

Anyway, that can be improved later, no need to resend the series again.
So:

Reviewed-by: Martin Wilck <mwilck@suse.com>

--=20
Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
SUSE  Software Solutions Germany GmbH
HRB 36809, AG N=FCrnberg GF: Felix
Imend=F6rffer



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

