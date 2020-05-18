Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id C83DE1D87C8
	for <lists+dm-devel@lfdr.de>; Mon, 18 May 2020 21:03:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589828605;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=omodvb4ZNG+xBFaVB27e/lp0TeLob8D2ceXMfy8m8B4=;
	b=eKTOoHVcM3O2FoezHfmPBvzCnMK1eEeT6rWTIodLxqa6hE9QSPIylHLL5mXbUzOaMBik3f
	J8Xdrpqa8cn6Y5oDF1dHysAbA6Cjf6uOh1ao1zflDcA4VSZSx7p3neRntP9BhwIiz2L7A8
	E5XwzPzFB0gGU6N+hTd2c4a7rm1H2v8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-6-yAOgDyMLyhWMCI7coaNQ-1; Mon, 18 May 2020 15:03:22 -0400
X-MC-Unique: 6-yAOgDyMLyhWMCI7coaNQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA24F8730EB;
	Mon, 18 May 2020 19:03:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 93BCE5D9E2;
	Mon, 18 May 2020 19:03:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8B40B4ED37;
	Mon, 18 May 2020 19:03:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04IJ38qu010386 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 18 May 2020 15:03:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7DD3D2166BA2; Mon, 18 May 2020 19:03:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 706A52157F23
	for <dm-devel@redhat.com>; Mon, 18 May 2020 19:03:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 766E5833B45
	for <dm-devel@redhat.com>; Mon, 18 May 2020 19:03:06 +0000 (UTC)
Received: from m4a0072g.houston.softwaregrp.com
	(m4a0072g.houston.softwaregrp.com [15.124.2.130]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-93-sPXDXabGMvyS2CDzmQ0YbA-1;
	Mon, 18 May 2020 15:03:03 -0400
X-MC-Unique: sPXDXabGMvyS2CDzmQ0YbA-1
Received: FROM m4a0072g.houston.softwaregrp.com (15.120.17.147) BY
	m4a0072g.houston.softwaregrp.com WITH ESMTP; 
	Mon, 18 May 2020 19:01:43 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
	M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Mon, 18 May 2020 19:02:53 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (15.124.72.10) by
	M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Mon, 18 May 2020 19:02:53 +0000
Received: from DM5PR1801MB1883.namprd18.prod.outlook.com (2603:10b6:4:62::23)
	by DM5PR1801MB1932.namprd18.prod.outlook.com (2603:10b6:4:64::26)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.31;
	Mon, 18 May 2020 19:02:52 +0000
Received: from DM5PR1801MB1883.namprd18.prod.outlook.com
	([fe80::cd6:b672:d8d3:2710]) by
	DM5PR1801MB1883.namprd18.prod.outlook.com
	([fe80::cd6:b672:d8d3:2710%7]) with mapi id 15.20.3000.034;
	Mon, 18 May 2020 19:02:52 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>
Thread-Topic: [PATCH 3/6] multipath: centralize validation code
Thread-Index: AQHWKlyAJzH6dTxVDUSurwxobVyG4qipnIIAgASZ8YCAAAKtAA==
Date: Mon, 18 May 2020 19:02:52 +0000
Message-ID: <d28941309f31ca447d8fc4f886acfd4e10c1d4da.camel@suse.com>
References: <1589507962-6895-1-git-send-email-bmarzins@redhat.com>
	<1589507962-6895-4-git-send-email-bmarzins@redhat.com>
	<58562235f673975a254f3ee41e4548900158022b.camel@suse.com>
	<20200518185315.GW5907@octiron.msp.redhat.com>
In-Reply-To: <20200518185315.GW5907@octiron.msp.redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2
x-originating-ip: [92.211.129.134]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 78800e00-e514-4679-ab8d-08d7fb5e10fb
x-ms-traffictypediagnostic: DM5PR1801MB1932:
x-microsoft-antispam-prvs: <DM5PR1801MB1932F06FBB8C7B53F6154482FCB80@DM5PR1801MB1932.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 04073E895A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9K2zlEyCfrKKZdIuJ5vt/Rqkoo8/+RwWAvTZ1i1jN3j+UllScP3V5ScGEEAW5Yzt8tBLxxr4Lj5BU5E66LI39tr2m6D7KR8yNtn+zOjwQCAbrDzZGTXKihkomhnBtRkquse7SdpYuL8Vkeo/41FjI9iG30+WIEztTeaOtqHn4sSVEUjxmaIRlb0OGoomwjI6Ee3sVh0DuLTWkuj45WxCSn3+JZmC62+xqPzNh8GmdcGausIEfJQjaD+e9aWe37rToEDLdI3r8C31UWc55tjge0mn18mYujISxvdAamav0yCjaYY8EGucYbkyXaXRX2Ag6PvjvyCqTR7FOfxx4o77j8K7xrBcJMZL9LzVFJ3b/Mi/KPipYwmSzFmYfcmsmNNaYshOxiOFiwS3COVgZ27GQBiAyBapQ/sUCkGv5ooJ7v2aOd19DqLBK2V3DN5RmFPd
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DM5PR1801MB1883.namprd18.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(8676002)(5660300002)(4326008)(6916009)(6512007)(478600001)(8936002)(6486002)(316002)(54906003)(2906002)(6506007)(2616005)(86362001)(186003)(36756003)(66556008)(64756008)(66446008)(91956017)(76116006)(71200400001)(66476007)(66946007)(66574014)(26005);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: 6FmzQZvePJHNS2wl5w3xIXmYrkuM33xSCCifR1YNTNvIQZ3qtFB/z9N/HyuHXS3uCM0t+Lx7v/7wMSAh71KAwJBNMtZUS3NBy9/LqvCZeI+bq5Mr067QMTEO4DagAQhVon8VYqxcfzaxF6p9qU5mlKh8dESBkjQFIRBTM+wnjpvVU00mpeGbsItbnK7HL2/VxihZl/iMJYj+Gs0npjryy3uVPIF2whP6kkl7xucaCXoGtwZNkui9IKcbkqsLrkhpd3lCrtwLZXtiP8C71RLPt77eTbz440+IgM/hEEOin0ipXpNt5XjDA/bztSPq/5TErj5yfdIS7r0F84kgdHnV71qLPlThpaWwioEa21QQi8hzGzN/7uoRx58ZDmH4fhWnZRUXdES/KKS+iDyuDYxWio4fTUVkzlxXvQzYfBtT9lXaJ9rKIhF65dw9fQDAjeDSoUi9ibjQfjAKwFKcaTa21PCdvtp3lAxT+mErQ4tU2RCLhyKyqZS4sBs2Xtcx9Ez2
x-ms-exchange-transport-forked: True
Content-ID: <A7361413298E914289BC16F2A852A3F8@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 78800e00-e514-4679-ab8d-08d7fb5e10fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2020 19:02:52.5441 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nU83fgq5+utw6mrAv3It0TNBf5RYAAqXi0lxXZJ0q2FYj1oXFi4fD/3SfaY18RjzSL+uu/U9/ZVRyXKP7dwknw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1801MB1932
X-OriginatorOrg: suse.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04IJ38qu010386
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 3/6] multipath: centralize validation code
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

On Mon, 2020-05-18 at 13:53 -0500, Benjamin Marzinski wrote:
> On Fri, May 15, 2020 at 08:37:16PM +0000, Martin Wilck wrote:
> > On Thu, 2020-05-14 at 20:59 -0500, Benjamin Marzinski wrote:
> > > This code pulls the multipath path validation code out of
> > > configure(),
> > > and puts it into its own function, check_path_valid(). This
> > > function
> > > calls a new libmultipath function, is_path_valid() to check just
> > > path
> > > requested. This seperation exists so that is_path_valid() can be
> > > reused
> > > by future code. This code will give almost the same answer as the
> > > existing code, with the exception that now, if a device is
> > > currently
> > > multipathed, it will always be a valid multipath path.
> > >=20
> > > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> >=20
> > Great job getting the logic right! Readability massively improved.
> > Almost ack, a few comments and questions below.
> >=20
> > Regards,
> > Martin
> >=20
> >=20

> > > -=09=09=09conf->find_multipaths |=3D _FIND_MULTIPATHS_I;
> > > +=09=09=09if (conf->find_multipaths =3D=3D FIND_MULTIPATHS_ON
> > > +=09=09=09    conf->find_multipaths =3D=3D
> > > FIND_MULTIPATHS_STRICT)
> > > +=09=09=09=09conf->find_multipaths =3D
> > > FIND_MULTIPATHS_SMART;
> > > +=09=09=09else if (conf->find_multipaths =3D=3D
> > > FIND_MULTIPATHS_OFF)
> > > +=09=09=09=09conf->find_multipaths =3D
> > > FIND_MULTIPATHS_GREEDY;
> >=20
> > Ok. Previously FIND_MULTIPATHS_SMART was not the same value as
> > FIND_MULTIPATHS_STRICT + _FIND_MULTIPATHS_I. Effectively, this
> > doesn't
> > change logic, but only because the check for ignore_new_devs_on()
> > in
> > should_multipath() is actually redundant. (IIRC in the past we'd
> > determined that "strict" + "ignore_wwids" makes no sense).
> >=20
>=20
> And I still feel like it doesn't make any sense, so this was
> intentional.  Are you arguing that we need that state, or are you
> just
> pointing this out?

Just pointing it out. That's why I wrote "Ok" in the first place. But I
stumbled on it at first sight, and took a while to realize that your
patch got it right. Which is worthwhile to note IMO, in order not to
stumble on it next time.

Sorry for not expressing that clearly enough.

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

