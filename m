Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id EA12B2784A9
	for <lists+dm-devel@lfdr.de>; Fri, 25 Sep 2020 12:03:15 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-K_yuiPAdPDKik3FFfFFK1Q-1; Fri, 25 Sep 2020 06:03:12 -0400
X-MC-Unique: K_yuiPAdPDKik3FFfFFK1Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A058864142;
	Fri, 25 Sep 2020 10:03:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F0651002C0E;
	Fri, 25 Sep 2020 10:03:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 97139181A06B;
	Fri, 25 Sep 2020 10:02:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08PA1CgH006198 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 25 Sep 2020 06:01:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 80737119027; Fri, 25 Sep 2020 10:01:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A56011902C
	for <dm-devel@redhat.com>; Fri, 25 Sep 2020 10:01:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 687F4811E79
	for <dm-devel@redhat.com>; Fri, 25 Sep 2020 10:01:09 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [62.140.7.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-334-j28cv2jEPoOeOb7-uurfbQ-1;
	Fri, 25 Sep 2020 06:01:07 -0400
X-MC-Unique: j28cv2jEPoOeOb7-uurfbQ-1
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
	(mail-ve1eur03lp2059.outbound.protection.outlook.com [104.47.9.59])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-40-lywWliC3Pl2zj2JUBpX7zQ-1; Fri, 25 Sep 2020 12:01:03 +0200
X-MC-Unique: lywWliC3Pl2zj2JUBpX7zQ-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (20.179.248.148) by
	DB6PR0401MB2358.eurprd04.prod.outlook.com (10.168.58.145) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.3412.24; Fri, 25 Sep 2020 10:01:02 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::f1a9:5330:1129:da6a]) by
	DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::f1a9:5330:1129:da6a%7]) with mapi id 15.20.3391.027;
	Fri, 25 Sep 2020 10:01:02 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>
Thread-Topic: [dm-devel] [RFC PATCH v2 0/3] add library to check if device is
	a valid path
Thread-Index: AQHWki+ErlMHDCZoc0mvVLY9K+HV1Kl3chCAgACJfoCAADAcgIAAYMwAgACUtIA=
Date: Fri, 25 Sep 2020 10:01:01 +0000
Message-ID: <2151af2280728eeeea5404bcda3cd6411a7173f5.camel@suse.com>
References: <1600923569-17412-1-git-send-email-bmarzins@redhat.com>
	<01ce499f8c7a7248f560066054ba4dd922bbc338.camel@suse.com>
	<20200924163007.GG11108@octiron.msp.redhat.com>
	<53ad2ea2f8457030eac247420fcc564bd5608ab8.camel@suse.com>
	<20200925010846.GL11108@octiron.msp.redhat.com>
In-Reply-To: <20200925010846.GL11108@octiron.msp.redhat.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5
x-originating-ip: [90.186.0.118]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d23ad4cd-ace3-40ef-c5a4-08d86139e8ed
x-ms-traffictypediagnostic: DB6PR0401MB2358:
x-microsoft-antispam-prvs: <DB6PR0401MB23584E4A483F9D0E0D1C64E4FC360@DB6PR0401MB2358.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: rcx93Y2JmX5WRWzXSyb6Ii8Tve6Ixai5c6pBpw+1lV/VGpyKwKLiy0OuLiWqGZOSO0lMVyQDKIZt8ST4y7M6l7wpUjqK1XZoqT+/kAjISHQkY1MdpNVxnvMdv071w6G4zctqAzcEN9KuJI95cg5PNhdCMs+EIGAqHJQBq3aVIxqa484BoqO2sFLHpJzg9Dkxfsk7W+IJavHUxdDQv5jAm/LfKmJcmTs/hLTrrDyt4VvK6Z9vqFv7TslmUNlEk7gwXwfnPoo+J5tErVuTNXffzkUlZWj7fbv2o9Js9wD0uIhbQIeh/k+/dYagboexGIeHw3Y7eceIPL5by73E5cZ7xKewMRfYGWCk/qr9Ab8c6tovh25KEXNYdhR0IXe1vU6J
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(376002)(39860400002)(346002)(396003)(136003)(8936002)(8676002)(478600001)(36756003)(316002)(44832011)(66946007)(76116006)(186003)(2616005)(26005)(6506007)(86362001)(4326008)(6486002)(6512007)(2906002)(6916009)(91956017)(83380400001)(66556008)(66476007)(64756008)(66446008)(66574015)(71200400001)(450100002)(5660300002);
	DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata: po13BvCnLDAPEkN7TC4CPa/EiMYMT+rJXl0NfHDpfB61ddKjHgnl6YmfJwqv3BGnlzJ5Xn6OgKJEjlLifLUiL+xCBT1aIN8iBRFQ2akuLgrN3+FPFvXMpUJLj+EjUVh+UK7xzYedKatKEeqSz2JV4r98BEnVSWiQl0fEDDgTRGAJ43/hklFDtufCN7/V+HjGT56XQBXvx9GOFqcstahPvFw7Uzcqqa8mvzqXTABU8IkjE0v6e3dT0Aq0O8u9+H5nMPW8tLkDAf7EMEdqgM5Z9Aq9eX0joCmqM1B2oOoq7FhTBqZ+YJJQ/TRuDWpeeVXQZrdb+lhhahNhah4oWJPR/cpCTalNHusUBphVaJyJ6ftW7OYy/XqTs+2i/Sq4ldZu9czf/L/9dEvnqSQF00kYkP7Ms1wODCJ9/l3MN9/zsbfJb9Bo1S71mMO5dFL6gnrmZXJQBmVwuRCID8MYOcg54pTRu22NsZPREBHd5TD0GM216lXV8ikB2xWsA/rym+MFsdMuJiuZr0xRn75GAatP+Rpi/nL7nvIlTuObVPgFG8fi6Ff06FH3A6buEn8ptL56urZ6E/+raTSSqnMsdOCdu+UmyKW0YaGVRO3nW5rjs3k8UKCPKPsNgK7Gv0hP3czrguB+HYCVHgCDkdBkxSDpxg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d23ad4cd-ace3-40ef-c5a4-08d86139e8ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2020 10:01:02.0932 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: txc50MoICpcCqxPQjTSpGhb3S+RyLInnT9iImC2bEftFd43irN0RSv/N5YGxHwXT6iU/gjdXme9bFu3Vzh7yfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2358
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08PA1CgH006198
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <FD44D69170761A4B95EA32AABF90F001@eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-09-24 at 20:08 -0500, Benjamin Marzinski wrote:
> On Thu, Sep 24, 2020 at 07:22:21PM +0000, Martin Wilck wrote:
> >=20
> > So, SID will call into libmultipath via libmpathvalid, udev will
> > obtain
> > the properties from SID, and multipathd will fetch them from udev
> > in
> > turn? Or will multipathd talk directly to SID? I seem to be missing
> > the
> > overall picture.
>=20
> Yeah. SID will populate the udev database with the necessary udev
> properties, and multipathd will get those udev properties just like
> it
> always does.=20

But then I'm not getting how you'll get along with a SID-specific
configuration for libmultipath's behavior. You want get_uid() to use
direct sysfs access for SID, and use udev for multipath(d). How else
would you achieve that?

More generally, I'm not quite convinced of the the design yet. The
information flow kernel -> (sysfs or ioctl) -> libmultipath(sid mode)=20
-> libmpathvalid -> SID -> udev -> udev db -> libudev -> libmultipath
(udev mode) -> multipathd is more complex than it needs to be. It might
actually increase the lags experienced by multipathd, which will still
have to wait for uevent workers to finish until it can be certain about
device properties. Not to mention that SID must be rock stable and
always available during boot, initrd processing, etc.

Why don't we rather write a common library for determining WWIDs and
the "should be multipathed" predicate, to be used by udev (with a
plugin), multipath-tools, SID, and possibly other tools like systemd
and LVM, with common, simple configuration, guaranteed to always
provide the same results? I mean, libmultipath already has all the
"intelligence" built-in to do this. We'd "just" need to cut down
configuration options drastically to get more reprocucible results, and
refactor things to obtain a minimalistic API. Unlike the current
libmpathvalid design, this wouldn't be built on top of current
libmultipath, rather vice-versa. multipath-tools would also benefit a
lot from such work.

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

