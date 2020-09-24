Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D13D8276B72
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 10:07:16 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-xlwZQ7azMJyElDZxjXSW3w-1; Thu, 24 Sep 2020 04:07:13 -0400
X-MC-Unique: xlwZQ7azMJyElDZxjXSW3w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79B9781F03E;
	Thu, 24 Sep 2020 08:07:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FA051002C05;
	Thu, 24 Sep 2020 08:07:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7AA357A00B;
	Thu, 24 Sep 2020 08:06:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08O86p7Q011690 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 04:06:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8F8A02166B27; Thu, 24 Sep 2020 08:06:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A1242166BA0
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 08:06:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 819FF8007DF
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 08:06:49 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [62.140.7.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-177-Bt7DooexMZqkaEgC8ztujA-1;
	Thu, 24 Sep 2020 04:06:45 -0400
X-MC-Unique: Bt7DooexMZqkaEgC8ztujA-1
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
	(mail-am5eur02lp2052.outbound.protection.outlook.com [104.47.4.52])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-24-rdgqnDAcM7KL6apRB64IUA-1; Thu, 24 Sep 2020 10:06:42 +0200
X-MC-Unique: rdgqnDAcM7KL6apRB64IUA-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB8PR04MB6844.eurprd04.prod.outlook.com (2603:10a6:10:112::23)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20;
	Thu, 24 Sep 2020 08:06:41 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::f1a9:5330:1129:da6a]) by
	DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::f1a9:5330:1129:da6a%7]) with mapi id 15.20.3391.027;
	Thu, 24 Sep 2020 08:06:41 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [RFC PATCH v2 3/3] libmultipath: change log level for null
	uid_attribute
Thread-Index: AQHWki+GW6QuBOs2Jk6Y7g17kvFjRal3buOA
Date: Thu, 24 Sep 2020 08:06:41 +0000
Message-ID: <62ced86c81b139e6461fe0dc14207606548a652a.camel@suse.com>
References: <1600923569-17412-1-git-send-email-bmarzins@redhat.com>
	<1600923569-17412-4-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1600923569-17412-4-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5
x-originating-ip: [90.186.0.118]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e1a9d88f-4b1c-46b6-3ef1-08d86060c52e
x-ms-traffictypediagnostic: DB8PR04MB6844:
x-microsoft-antispam-prvs: <DB8PR04MB68446107A526B305F39F1ABCFC390@DB8PR04MB6844.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PUKTzOBImy+pMaiBh3iqWb9Zn3bqw8WKqDMxOzM0Raf+RiJTIf5E44nXaMGtu6Otd3IiP+FeP006ElqzgFg50jnRpyqs7LHaRSrPASL/kexMaa2EU9Q0bzGub6fWpZ/9fT9TcnITymO16WFY7ZqbQAFeZh5qbmQphDTY/LIKhkfGArDmyFSpS17Gbp2iR4HZ3U6rgJskhrxLI8kJIVku6AeNNsF2OMlhfSJramu+b3wQqniWIp99jQXGAGsuKa857HlPfKDNrcjNlykvdnSMf0pD10xf9anW/zVnaJyCwAbiduYExap3ro20HT9H2/AuPRtKO4IQKEmjBObbqZipYzNzIoxxy5JH184sXOrssathpJ0hfggiEO1n9URf7lDu
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(39860400002)(366004)(396003)(346002)(376002)(136003)(8676002)(6486002)(86362001)(91956017)(5660300002)(66574015)(6512007)(2906002)(83380400001)(8936002)(76116006)(66476007)(66946007)(64756008)(66446008)(66556008)(36756003)(4326008)(26005)(71200400001)(6506007)(316002)(110136005)(2616005)(186003)(44832011)(478600001);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: OcuNWPBroAiSnDwbZkA5Q246YImKppNIcX1qKY3btUx3ainYPQAggFjNZzvhHFYO0BvwzDxydAOKS1uchHuJBlczTgQQ2O1uqSP2s7PEFG3RjgHllaJ7akr6gl1683db3+vvgZ1dRxaZokBAegRxZ/TX60URY0F5xzmDVsBV9mmycARpnzIxKVj+GAcBwyTS3EjjNYd3mH/tc01USRz0kLCRMIyOKCzWp4s45nvhQTi1dTSe8vl3XAtrIAiBqHuTvw2aVzM6RFU2iTndgiFFsN+I7+gMSVo9qun7BPKIFa7nZLPpkbq0IDSvKjW0Fpqg4s6WEOXIqO/W2mhYkRp7U5cxNEpo2waMusc3oP8qVOVILR8mX4qbyTiwdnVmWJ12HTq7Omz5lxZ7N5OfRp5zAwMlMqxlJWuDqqkQQtWwGJ0WFTDLTOkTKSarMKCBcSaFWF+9unB5mbF8+2zOv2bO2ldIQjCR6M7Qqw2wgs1EtjTh3ujfLkLpb7/OtPrFd9KvW+Ka6gVnUEhbbndy4NJepZZy7VVsQHEQ063BddTcaNOfQmStTo/405xz6S8Ht34dRo5Hdx94OS5q+m8bGcStJahAYoZIRmiP5rEkli58JjrXp0ZACJ/teU/8HqRjjLrw/Sck0pRIQPEiC+w5anaqjQ==
x-ms-exchange-transport-forked: True
Content-ID: <6B833E29F6E34F4C8C56F11CC6557ED7@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1a9d88f-4b1c-46b6-3ef1-08d86060c52e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2020 08:06:41.3634 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eTDGZfZwAAbZOWGr3QG7cq++QwbFeJQBA2Uf93heQM4XjlkHYQM7cngyIVjwbHVJdDmVGmiHS15QkD8HrVLtqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6844
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08O86p7Q011690
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [RFC PATCH v2 3/3] libmultipath: change log level
 for null uid_attribute
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

On Wed, 2020-09-23 at 23:59 -0500, Benjamin Marzinski wrote:
> If uid_attribute is explicitly set to an empty string, multipath
> should
> log the uid at the default log level, since using the fallback code
> is
> the expected behavior.
>=20
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/discovery.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
> index f650534f..435f2639 100644
> --- a/libmultipath/discovery.c
> +++ b/libmultipath/discovery.c
> @@ -2091,7 +2091,8 @@ get_uid (struct path * pp, int path_state,
> struct udev_device *udev,
>  =09=09}
>  =09=09if ((!udev_available || (len <=3D 0 && allow_fallback))
>  =09=09    && has_uid_fallback(pp)) {
> -=09=09=09used_fallback =3D 1;
> +=09=09=09if (udev_available || !(udev && pp-
> >uid_attribute))
> +=09=09=09=09used_fallback =3D 1;
>  =09=09=09len =3D uid_fallback(pp, path_state, &origin);
>  =09=09}
>  =09}

Uff, this logic was convoluted anyway, now it's even harder to grasp.
IIUC, if !udev, used_fallback will be set to 1, even if=20
pp->uid_attribute is the empty string. Is that intended?
To make this easier to read, I'd suggest something like this:

=09=09bool valid_uid_attr =3D pp->uid_attribute
=09=09=09&& *pp->uid_attribute;
=09=09bool empty_uid_attr =3D pp->uid_attribute
=09=09=09&& !*pp->uid_attribute;
=09=09bool udev_available =3D udev && valid_uid_attr;
      ...
=09=09if ((!udev_available || (len <=3D 0 && allow_fallback))
=09=09    && has_uid_fallback(pp)) {
=09=09=09if (!empty_uid_attr)
=09=09=09=09used_fallback =3D 1;
=09=09=09len =3D uid_fallback(pp, path_state, &origin);

Regards,
Martin

--=20
Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
SUSE  Software Solutions Germany GmbH
HRB 36809, AG N=FCrnberg GF: Felix
Imend=F6rffer



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

