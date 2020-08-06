Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 348AB23D94B
	for <lists+dm-devel@lfdr.de>; Thu,  6 Aug 2020 12:35:54 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-pBGGVQ6sNne9Vg1a1L36eA-1; Thu, 06 Aug 2020 06:35:51 -0400
X-MC-Unique: pBGGVQ6sNne9Vg1a1L36eA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44692809B66;
	Thu,  6 Aug 2020 10:35:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 915AA60E1C;
	Thu,  6 Aug 2020 10:35:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EB0179692E;
	Thu,  6 Aug 2020 10:35:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 076AUfpt030000 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 6 Aug 2020 06:30:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1845A207AEB8; Thu,  6 Aug 2020 10:30:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E9B81207AEB5
	for <dm-devel@redhat.com>; Thu,  6 Aug 2020 10:30:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C1EE805B00
	for <dm-devel@redhat.com>; Thu,  6 Aug 2020 10:30:37 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [62.140.7.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-284-a61FOjL_NO-KWRBeAUgysg-1;
	Thu, 06 Aug 2020 06:30:34 -0400
X-MC-Unique: a61FOjL_NO-KWRBeAUgysg-1
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-20-Q2nWjK7QNN6Fr-7CJHy-2A-1; Thu, 06 Aug 2020 12:30:31 +0200
X-MC-Unique: Q2nWjK7QNN6Fr-7CJHy-2A-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB8PR04MB7114.eurprd04.prod.outlook.com (2603:10a6:10:fe::8) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19;
	Thu, 6 Aug 2020 10:30:30 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::8130:53b2:48d5:593]) by DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::8130:53b2:48d5:593%3]) with mapi id 15.20.3261.019;
	Thu, 6 Aug 2020 10:30:30 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 2/6] kpartx: fix -Wsign-compare error
Thread-Index: AQHWZEuWW8kWG+/SAEe0sklwQaqaB6kq8J0A
Date: Thu, 6 Aug 2020 10:30:30 +0000
Message-ID: <6a8a2544bf10ae6e4d61bf93f8026216c3e90782.camel@suse.com>
References: <1595877868-5595-1-git-send-email-bmarzins@redhat.com>
	<1595877868-5595-3-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1595877868-5595-3-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.4
x-originating-ip: [90.186.231.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9d607089-f095-4770-1d3d-08d839f3be28
x-ms-traffictypediagnostic: DB8PR04MB7114:
x-microsoft-antispam-prvs: <DB8PR04MB711451CAB5242D0BFE329C28FC480@DB8PR04MB7114.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SBQ9Hog45FRZI+XLIXoeoMpACWHPxwbVyDq4hnRrnzlSoJPU2tvphAPlYp9c8ec838UjN6093Mqtnhlq8DEeV1J1SdX77syhn3ijQ6zw/AA6S2eE2Bgn8lmDjdGYUUkii7WLJz2HnQWO8HJSQ6QYuGo3ONRnBKQMCl45IiFc8HKHUdOdihSyVfg3bfINHg/yLkVRDKJGkNA04knC8XbrOFVhvw7/eAHPML5bJV4QM/4aKCb9ctFl+OV0cRxi68KEEqI35EhwhTA4TX5ktYRWxGMVyvnKtL1XLRuC0UrByYYJOPCjWrfcufsq7DT1dYcTnxD+XuzRutLjgpTiJjBcFA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(376002)(346002)(366004)(136003)(396003)(39860400002)(6486002)(8676002)(4326008)(478600001)(6512007)(316002)(110136005)(2906002)(8936002)(71200400001)(86362001)(2616005)(66946007)(76116006)(66476007)(64756008)(66446008)(91956017)(36756003)(66556008)(5660300002)(83380400001)(6506007)(186003)(26005)(66574015);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: gzH5qEIoet0xFnG0pU/Z95Jy2yTVJ2sjxlmIGgc8CDJaw6K+uki7lwdH2uA7++K9iz1qv9+xyG/K0FZ9Irs10Yj5plThOQJQaXfP8+I4C90UfZknIoDxCUQrAlzBScAvUFmqulv3Ya/NHpWjNsHCqinu/GPoSyZ7SCs5kRSOl9g8EeGUq9jb+j4+dB8ccA4s54nDPYBXdBmWc9ibSy3Ysk/jJvJvx6OWDGv4iPMZftIDo3IhAAiv3iNAq/yij3KFAP3ySXsIpUPvP7B6cLUauapYrYazdFyL+wTPxHNSW/8GWu3E6SQiQ0pOunuI5qgiq3de99aYnbgXQX/WTcTcIrSD+4yu/TFNU6pbiXmx1yU/s5DjbhQlgA1ZsBMrmKGKN2RDbYn9+aPUhe0ZR/LOFY0zDmPMrGIxl1kOWOLE2Aik2qZ/xuDA0NjqBEfAntcio2Dtfd8KMUIQPLyG4N26GCusyBVLitJtMUfjqsdn/0FgM2fNYSO6ThlOIjbxOB0qI2I2AfSX6MK1vdpn4QIscfysYdScAMAZt0hB6OVvUaC2T+w+rYIlD0fccriN/yo1FJSUZDJmoT7GQIuPphTJUHDbH0bFL5VXpg6z9AdcOrfd5zsZdv1/W1hUA9BPlrYVJzcFWWoLLjE78PDm9D4a/A==
x-ms-exchange-transport-forked: True
Content-ID: <32A8E024AC962A4FB5709ADBF018860D@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d607089-f095-4770-1d3d-08d839f3be28
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2020 10:30:30.2351 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mRy/YzpVGzMxcloHIGgvYzhJv+f+sOsjkw6qFIEo9htb4dshaLo9kErXXXzHxzUE8tH9Umkc2IQ183XF34wrfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7114
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 076AUfpt030000
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 2/6] kpartx: fix -Wsign-compare error
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
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-07-27 at 14:24 -0500, Benjamin Marzinski wrote:
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  kpartx/kpartx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/kpartx/kpartx.c b/kpartx/kpartx.c
> index c24ad6d9..653ce0c8 100644
> --- a/kpartx/kpartx.c
> +++ b/kpartx/kpartx.c
> @@ -738,7 +738,7 @@ struct block {
>  /* blknr is always in 512 byte blocks */
>  char *
>  getblock (int fd, unsigned int blknr) {
> -=09unsigned int secsz =3D get_sector_size(fd);
> +=09int secsz =3D get_sector_size(fd);
>  =09unsigned int blks_per_sec =3D secsz / 512;
>  =09unsigned int secnr =3D blknr / blks_per_sec;
>  =09unsigned int blk_off =3D (blknr % blks_per_sec) * 512;

I was wondering why I didn't see this one. Turns out that it occurs
only for 32bit compilations. It looks like sort of an overzealous
compiler warning to me, as it's only about a "!=3D" comparison that can
hardly produce a wrong or unexpected result.

Btw, not that it would matter much, but the value of he BLKSSZGET ioctl
is actually unsigned.

Anyway, ack.

--=20
Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
SUSE  Software Solutions Germany GmbH
HRB 36809, AG N=FCrnberg GF: Felix
Imend=F6rffer



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

