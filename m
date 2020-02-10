Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id A339A157DE1
	for <lists+dm-devel@lfdr.de>; Mon, 10 Feb 2020 15:54:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581346478;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LdhkxtBo/cfNON+xOZv3IDF5VorWia77yL4DaYK6A6s=;
	b=XcPPBBBu9U1hVxfPgKGhLbEqN249vnBe8qYFd5uXrttjCMmx7Rta0ArsW+USW/Xwf0JQG4
	VNRV8Q3O93IqpzOY9LgH+AqtamZSP47jFMh4Wu6j9m7v2R97fWDZcSrG88jvoUwZqdqRDM
	x/O3iCM+zjJAdrXS6NIX2FY9YSSqcyo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113-YDKVfuaBNlC05ADy47hTkQ-1; Mon, 10 Feb 2020 09:54:36 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 088B2800D41;
	Mon, 10 Feb 2020 14:54:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9B2110021B2;
	Mon, 10 Feb 2020 14:54:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 650A5183269E;
	Mon, 10 Feb 2020 14:54:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01AEraW1019302 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 10 Feb 2020 09:53:36 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9F49B2166B2B; Mon, 10 Feb 2020 14:53:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 99AF62166B2A
	for <dm-devel@redhat.com>; Mon, 10 Feb 2020 14:53:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 806C7800F48
	for <dm-devel@redhat.com>; Mon, 10 Feb 2020 14:53:34 +0000 (UTC)
Received: from m9a0013g.houston.softwaregrp.com
	(m9a0013g.houston.softwaregrp.com [15.124.64.91]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-259-uVMHQ1yKNTyM5oqggnRIBA-1;
	Mon, 10 Feb 2020 09:53:32 -0500
Received: FROM m9a0013g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0013g.houston.softwaregrp.com WITH ESMTP; 
	Mon, 10 Feb 2020 14:52:45 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Mon, 10 Feb 2020 14:51:53 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (15.124.72.11) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Mon, 10 Feb 2020 14:51:53 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com (10.175.223.16) by
	DM5PR18MB1178.namprd18.prod.outlook.com (10.173.212.148) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2707.21; Mon, 10 Feb 2020 14:51:52 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::946a:bcb6:670b:8e86]) by
	DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::946a:bcb6:670b:8e86%12]) with mapi id 15.20.2707.028;
	Mon, 10 Feb 2020 14:51:52 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH v2 12/17] libmultipath: change failed path prio timeout
Thread-Index: AQHV3FZbWm9vToX1O0m4uyanX3RDs6gUiv+A
Date: Mon, 10 Feb 2020 14:51:52 +0000
Message-ID: <c852ad0717dd51caf3161aa283b0e93059cdebfc.camel@suse.com>
References: <1580929100-32572-1-git-send-email-bmarzins@redhat.com>
	<1580929100-32572-13-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1580929100-32572-13-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.218.227.247]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dfecfb57-2bc7-4032-83de-08d7ae38c3e9
x-ms-traffictypediagnostic: DM5PR18MB1178:
x-microsoft-antispam-prvs: <DM5PR18MB117888E584128EA424CB171DFC190@DM5PR18MB1178.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 03094A4065
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(36756003)(71200400001)(2616005)(478600001)(66556008)(66446008)(64756008)(66476007)(6512007)(6486002)(76116006)(66946007)(91956017)(5660300002)(26005)(6506007)(110136005)(4326008)(86362001)(186003)(81156014)(2906002)(316002)(66574012)(8936002)(8676002)(81166006);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB1178;
	H:DM5PR18MB1355.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NziDcMON9bltRb2sttLWunR6OWpFaIStUafflmRpf7cDbg2NzCENRL6u9HD9P79nuA6X6YD0gbh92R8GkSE3L0ysl8b67LHPjKXXZnhnzjD8Ik0hkmwdGR25yGEcmAcRHn3gQVkAkziSVShaPgNOyrOwRKTLOmoGOqHTeniOK4TuBFqbXtUeHiI871TUPgC8Fh8tKwsh98xymLuB9D121wctWzXA5YpRnhAIBf0DNSz7decwfQpAOWWmFxmkqMPhpYwFb/tkJyQ9I4yOJXceKErYd2iZP4AQkJq5+RR+H0SMfOS/VnaoXGwoOCKVy555gDIfus5i3N3n8eZKElvuahf1ltMClWcxG4TxX3vZQ/Yk8M8nqxYbInlgaoEJ62cnOZJr+K6bTuyDMOPREvhGG7E6ywAF6jf6fblWSVp5GPxHoxDoH+tMyzt75MeTfx3r
x-ms-exchange-antispam-messagedata: JO/y2BVGLMsH8h6Vj99I6LWAhyTRjY6BVBNe0PREJOEVapfYn5sTUXN/scUfHPshVI5OtbvLZjGJZmVctc52uwsz0bOwKr+x1qjSazU+4eoYOd8DuwEFnyEkiHcf0QdkSuwZXhBeaHI3W966HimsuQ==
x-ms-exchange-transport-forked: True
Content-ID: <B179715B43A315439BF9DCF449D8F06B@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: dfecfb57-2bc7-4032-83de-08d7ae38c3e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2020 14:51:52.2477 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NQesGz/4GOatxdvFWkL8uFzDehVabfjfG8v37YcpWSafCK/0qmluH0Y9LzH+OtgUfJYIa3osjWzMSjhhykLVlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB1178
X-OriginatorOrg: suse.com
X-MC-Unique: uVMHQ1yKNTyM5oqggnRIBA-1
X-MC-Unique: YDKVfuaBNlC05ADy47hTkQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01AEraW1019302
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH v2 12/17] libmultipath: change failed path
	prio timeout
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-02-05 at 12:58 -0600, Benjamin Marzinski wrote:
> multipath will try to get the priority from a PATH_DOWN path, if the
> path doesn't currently have a valid priority. However, if the
> priority
> code needs to contact the device to get the priority, this is likely
> to
> fail for PATH_DOWN paths.  This code dates back to when multipathd
> could
> not easily reload device tables with failed paths, so getting the
> correct priority was important to have a correctly configured device.
> Now multipathd can simply reload the device to move the path to the
> correct pathgroup when the path comes back up.  Since there are a
> number
> of prioritizers that don't require talking to the device, multipath
> shouldn't completely skip attempting to get the priority of these
> paths,
> but it should set a small timeout, so that it isn't hanging in the
> case where it needs to contact a device through a failed path.
>=20
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/discovery.c | 14 ++++++--------
>  libmultipath/prio.c      |  6 +++---
>  2 files changed, 9 insertions(+), 11 deletions(-)

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

