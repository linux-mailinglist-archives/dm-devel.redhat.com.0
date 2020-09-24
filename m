Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 21BF9276B9F
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 10:18:29 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-eXNzZs0-MDqrEAyQ9ojkAw-1; Thu, 24 Sep 2020 04:18:26 -0400
X-MC-Unique: eXNzZs0-MDqrEAyQ9ojkAw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FFC66417A;
	Thu, 24 Sep 2020 08:18:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A78455BBB8;
	Thu, 24 Sep 2020 08:18:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7FD74181A06B;
	Thu, 24 Sep 2020 08:18:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08O8ICA5013864 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 04:18:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C3DE12024508; Thu, 24 Sep 2020 08:18:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB5612018034
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 08:18:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 19EA0185A78B
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 08:18:10 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [62.140.7.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-3-tT4j0K7HOqC8qcF4shWVRA-1;
	Thu, 24 Sep 2020 04:18:07 -0400
X-MC-Unique: tT4j0K7HOqC8qcF4shWVRA-1
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
	(mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-24-I8bj5T9hMEqKIOQ1Js32hQ-1; Thu, 24 Sep 2020 10:18:05 +0200
X-MC-Unique: I8bj5T9hMEqKIOQ1Js32hQ-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB8PR04MB5753.eurprd04.prod.outlook.com (2603:10a6:10:b0::20) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22;
	Thu, 24 Sep 2020 08:18:02 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::f1a9:5330:1129:da6a]) by
	DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::f1a9:5330:1129:da6a%7]) with mapi id 15.20.3391.027;
	Thu, 24 Sep 2020 08:18:02 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [RFC PATCH v2 0/3] add library to check if device is a valid path
Thread-Index: AQHWki+ErlMHDCZoc0mvVLY9K+HV1Kl3chCA
Date: Thu, 24 Sep 2020 08:18:02 +0000
Message-ID: <01ce499f8c7a7248f560066054ba4dd922bbc338.camel@suse.com>
References: <1600923569-17412-1-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1600923569-17412-1-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5
x-originating-ip: [90.186.0.118]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2cfa3f09-586e-4703-33f9-08d860625b69
x-ms-traffictypediagnostic: DB8PR04MB5753:
x-microsoft-antispam-prvs: <DB8PR04MB57532EF56012AF3774CB6913FC390@DB8PR04MB5753.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: InNl/WpTSlFR6vzHXMVzENsG6oSHf9Eoi1RoqRcNM0lq4rkno23dr96kLd8DVhs0tpVQEvSk9bfTaUN/d852jUZYqZ5D9djVbRKHALhZPVPBLpCrlKbftALZk+5JpD1BuVSnqb/fwy6WEAHHDE9RWwAqlrLPJ+N6HZ5D/Pr6OswD3TL0z+55Ehmn6oWfjjufOkpM6+Ad5Lsk/QMIGSiuxoYg20qusglsrNHP8L10+eMUwkUNylDYb8NauoTZuYS0r6kAIJD4E5Es9v2ug+CFharB8OpM54NUK3JcYZhcbd31+cWb+kh4t8wbzFVGvNMg17IROyy56Ncbqi8QOFwYv3kt5ItYuKJjxb2s2P+zePDEmnfHAtL1v7W+5WhpnYlJFptSJCvWHvp6u+IBbRKPbg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(396003)(346002)(376002)(136003)(366004)(39860400002)(6512007)(86362001)(478600001)(44832011)(6486002)(4326008)(110136005)(316002)(66476007)(66446008)(2906002)(64756008)(966005)(66556008)(8936002)(8676002)(5660300002)(36756003)(76116006)(66946007)(91956017)(71200400001)(66574015)(6506007)(26005)(2616005)(186003);
	DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata: eaR6iknm+TzG49+izlPfGLvLs5n0oJM0oXroblz6R8mVf1Qg58TIwS6+qOvA0CAqxIk2Fhf95gFupZR/oNdNyWFm7Yfckfght4Wmppnq+2vJaa99FhfqQO7WsepEXZjJJWmSTDR91X8pR/wNrkId5x6Q3nOBxboH/eKt+mcan94vX25PEeOLuLu3h8c0FLkpGArsCr29m7EYaolagSRuE6+wVFVFUWyDXIytzjv0Tj8NLYtT1VsXwJmV6YB17DbkCHzYXdnohUvsaCV/7IxLXWKsfK+d7fryDIDBIKsRFq+L+LT0NX2+NZf8hpprzyUrg7uihuBnqZlSvbhUaQbN4pOwgYzNaPLIgq++t0A97/1pDjEeTcOKhPqW+mguNuLoERFphnfVYomeVmjN99uVs1jreVArQpLDn9bkQOqDNOwKDEqC1YDWyP8EhMxTEjzzq3C4KG9iE6vUkq/+3E1Yyr4/di6svKU/tWf0NSpeUXOggkdyhSO8BSzIQcw0udTZK9mFfm1+inubRYW4EXe1e+fSPGGU0+c4FEb6AifwlS44MxAKeYpGZxMjdqEKJ39+0leVyeYrR2mGeFMYQCsQwWBPd6PWO4/aOMN3yL5x9m8QBpr9c788q2Y66yRo77WGHD9L/adOOcMUvlB3ASDGVw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cfa3f09-586e-4703-33f9-08d860625b69
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2020 08:18:02.8988 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HehzoDE3d3FaiRJBMyDCLhVditQwwM1CnVzRgYGtJbkktTxzs8I7Gan25DXkb5OWeWeDa1iZOiayLeSbymWOpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5753
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08O8ICA5013864
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [RFC PATCH v2 0/3] add library to check if device is
	a valid path
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <44444FFB5E9C5945934B0FB0F77BA240@eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-09-23 at 23:59 -0500, Benjamin Marzinski wrote:
> The main part of the this patchset is the first patch, which adds a
> new library interface to check whether devices are valid paths. This
> was designed for use in the Storage Instantiation Daemon (SID).
>=20
> https://github.com/sid-project
>=20
> Hopefully, I've removed all the controvertial bits from the last time
> I
> proposed this library.
>=20
> The second patch adds get_uid fallback code for dasd devices. The
> third
> patch just changes the get_uid log level for devices configured with
> uid_attribute "". This is because it is currently necessary to
> configure
> multipath with
>=20
> overrides {
>         uid_attribute ""
> }
>=20
> to claim multipath devices with SID (instead of using
> multipath.rules),
> since SID doesn't currently get the UID information itself, and it is
> called by udev before this information is added to the udev database.
>=20

This makes me wonder how SID and multipathd are supposed to coexist.
We wouldn't want this overrides directive for multipathd itself, would
we?

Actually that "overrides" begs for allowing a custom configuration file
for libmultipath to be used with SID. OTOH, that would allow the
configurations to diverge, which might cause issues, too (in particular
if blacklisting options were different).

I think what we should do is allow applications to set overrides like
this at runtime, modifying the configuration. Perhaps we could support
an application-specific, additional config_dir, from which items like
the above could be read in addition to the regular configuration files.
This additional configuration would not be used by multipathd and
multipath. Does that make sense?

Regards
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

