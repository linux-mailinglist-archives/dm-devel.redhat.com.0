Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3410D26C3D9
	for <lists+dm-devel@lfdr.de>; Wed, 16 Sep 2020 16:46:50 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-JoA_y3fiMLqGFpw713j8Cw-1; Wed, 16 Sep 2020 10:46:45 -0400
X-MC-Unique: JoA_y3fiMLqGFpw713j8Cw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30FE7100831E;
	Wed, 16 Sep 2020 14:46:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C4F9A60CD1;
	Wed, 16 Sep 2020 14:46:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 31088183D02D;
	Wed, 16 Sep 2020 14:46:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08GEkSlP017750 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 16 Sep 2020 10:46:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0306230B85; Wed, 16 Sep 2020 14:46:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F0D6FF566C
	for <dm-devel@redhat.com>; Wed, 16 Sep 2020 14:46:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E1C3A18AE94A
	for <dm-devel@redhat.com>; Wed, 16 Sep 2020 14:46:25 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [62.140.7.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-292-OpEU6nGgPuSXa_2mfX-etg-1;
	Wed, 16 Sep 2020 10:46:23 -0400
X-MC-Unique: OpEU6nGgPuSXa_2mfX-etg-1
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur01lp2051.outbound.protection.outlook.com [104.47.0.51])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-2-J0Aw6iGbOymVlyg1M3Y10Q-1; Wed, 16 Sep 2020 16:46:20 +0200
X-MC-Unique: J0Aw6iGbOymVlyg1M3Y10Q-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB6PR0402MB2744.eurprd04.prod.outlook.com (2603:10a6:4:94::22)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16;
	Wed, 16 Sep 2020 14:46:19 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::f1a9:5330:1129:da6a]) by
	DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::f1a9:5330:1129:da6a%7]) with mapi id 15.20.3391.014;
	Wed, 16 Sep 2020 14:46:19 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 3/3] libmultipath: add ignore_udev_uid option
Thread-Index: AQHWi6mI1oe6A5UBwEu9xjxlkcqb5qlrWPIA
Date: Wed, 16 Sep 2020 14:46:18 +0000
Message-ID: <6442fa8e24eaa44a5487d16de95a712ed9d76125.camel@suse.com>
References: <1600206312-6497-1-git-send-email-bmarzins@redhat.com>
	<1600206312-6497-4-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1600206312-6497-4-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5
x-originating-ip: [90.186.0.118]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 53fe9e3b-2c79-4102-925f-08d85a4f45a8
x-ms-traffictypediagnostic: DB6PR0402MB2744:
x-microsoft-antispam-prvs: <DB6PR0402MB27449ED33178D81CD911EFCBFC210@DB6PR0402MB2744.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jWqYwSPgLUmLamhHi1I8u85AEiHdmpHrrXf2MZtE3ubO0nu2WtU/WhKJubrf4Znuj4gszcBh25BX7Qb+zZ72u/4wvzLGMeVgDxpln1u9CxK3zzG0VaaqRCNvkEIt77q5EnOLUALzSnQ1cwaLYu3842wrUFBsm1Olc6gj/48DjZmlmc33x9n0hzgRbwTteLQPg1tGpb/xrYO08G/wbgq7kAdVIr+uVgEkNQ+kAMcuQi3IkLS7yHtBp6JpucQh2amIhWfN8E3EfxXx9BOVwdtKgpQ53Sy50FdCrbKRQ4Oph4EKJPf7Ii6Hm2slXogKwWqMsirPbuixWCBU/gu8AGpO8w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(39860400002)(366004)(346002)(396003)(376002)(136003)(26005)(44832011)(2616005)(186003)(5660300002)(316002)(478600001)(6486002)(6512007)(6506007)(8936002)(71200400001)(2906002)(66574015)(66556008)(66446008)(66946007)(110136005)(64756008)(91956017)(36756003)(8676002)(4326008)(86362001)(66476007)(76116006);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: UY5lLH5/5y1jLjKgUfvb3soDmcIQFzX5ckVwmcKJpSNJN7cvwez1iQgfL2+n+rOfzbSH8ok1rovk/v5ycOXMfnGeaGFOm47Qc1/Z8S4BpzHVkyYUkkFmNnaSx3YjmV9BuiLqBFDOlgf6RoFDNwqP2mZs04uaEG+zDIW7BWrRB4X0JsMNJ1JEmg7zKI9twlcA+I2ngFDZdGT/ensKAkZNzoVx9ugqh64zm5Sj4GdcbQrRokV7MyTPaFOkdZEwz/r1idgHgoHfv1E8FRQxj2by5bZ719c3dLzhRvaQaE7duTUFj8WTyb9M9GesHFvzx+X2iFirp9q2oPyQrBJmKK7QIUyiBNiujfy4gCgOxIn8O4pFTSDWzjjrQxz+4Ebj25IZmA6H54c4Nh6J9Tqlua8CPCb41rDVJmB3LCfJPeXTVDRPeL7+faMOMdLmybDTSDicP0zxq+Y/K2LjpX9kag+AuMRSw0a7zZzg97hJzKd6EvMLXn3MhFnHg8pPuXBbD+PUj7rnDe/pJHxLcXtCi2L1EgP0qB1SZq5CAWogh/CRU0rP+Dqb29nNRnKTX/em8d1B0myO1ql/P5p3wh16D4QyHBcOcHkDV2aGOCyJ8dKiIwM0ZA6gYCMEK7qpiW6GLzgI+Yqx3lyz3RTA5g8dnGVssg==
x-ms-exchange-transport-forked: True
Content-ID: <D1BA8256342E544BAC169BF9D65630FC@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53fe9e3b-2c79-4102-925f-08d85a4f45a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2020 14:46:18.8947 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xZI1paRuLSjygcTCN0RLAi5vOz8H3pmJolrDo2njQn1VWTxFOKmBeEAY75B1Hmj4Y2rlmqWvmZA7K75VOyGqDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2744
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08GEkSlP017750
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 3/3] libmultipath: add ignore_udev_uid option
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Hi Ben,

On Tue, 2020-09-15 at 16:45 -0500, Benjamin Marzinski wrote:
> Setting this option to yes will force multipath to get the uid by
> using
> the fallback sysfs methods, instead of getting it from udev. This
> will
> cause devices that can't get their uid from the standard locations to
> not get a uid. It will also disable uevent merging.
>=20
> It will not stop uevents from being resent for device that failed to
> get a WWID, although I'm on the fence about the benefit of this.
>=20
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>

Can you explain how this differs from setting uid_attribute to the
empty string (and leaving uid_attrs at the default, empty)?

The patch is alright, but the configuration of WWID determination is
already sooo complicated... I'm not too happy about adding yet another
option which complicates matters further. IMO we should rather attempt
to make this easier for users (meaning less options, less combinations
thereof, and less "x supersedes y but only if z is not set" kind of
logic). This is not a nack, I just want to understand.

Regards
Martin

--
Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
SUSE  Software Solutions Germany GmbH
HRB 36809, AG N=FCrnberg GF: Felix
Imend=F6rffer



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

