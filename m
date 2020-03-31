Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 302F8199726
	for <lists+dm-devel@lfdr.de>; Tue, 31 Mar 2020 15:12:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585660354;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1PSDU6A/pH6T3obNKhaQHxvldwpqHJFGxIkxoecqAgc=;
	b=YXoGgb1/sNzyVy7CEKgwcUtFEO1/PmdW2YG74E6+uTVi+/BhumN1IxNjAmV2K/bMzb5DC7
	ll3fr3c7R5AeKIoeYkkn8SpN8b87ovh8dXePRXuJJskBpgz3y1o1INE6JAx02QqrbdluuN
	90Bfw4GWDmAfw7jz1j4wqqy5qxguXGs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-6M1QJCpJODOczvqZuEWqPw-1; Tue, 31 Mar 2020 09:12:31 -0400
X-MC-Unique: 6M1QJCpJODOczvqZuEWqPw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81AE7801E67;
	Tue, 31 Mar 2020 13:12:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 600045C1C5;
	Tue, 31 Mar 2020 13:12:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3E3B186BFF;
	Tue, 31 Mar 2020 13:12:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02VDBsep007190 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 31 Mar 2020 09:11:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3AF852166B2A; Tue, 31 Mar 2020 13:11:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 366CE2166B2F
	for <dm-devel@redhat.com>; Tue, 31 Mar 2020 13:11:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A1E85800296
	for <dm-devel@redhat.com>; Tue, 31 Mar 2020 13:11:51 +0000 (UTC)
Received: from m4a0072g.houston.softwaregrp.com
	(m4a0072g.houston.softwaregrp.com [15.124.2.130]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-290-jUFI-A8qOY-rB6PKktfrrw-1;
	Tue, 31 Mar 2020 09:11:46 -0400
X-MC-Unique: jUFI-A8qOY-rB6PKktfrrw-1
Received: FROM m4a0072g.houston.softwaregrp.com (15.120.17.146) BY
	m4a0072g.houston.softwaregrp.com WITH ESMTP; 
	Tue, 31 Mar 2020 13:10:23 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Tue, 31 Mar 2020 13:06:02 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (15.124.8.14) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Tue, 31 Mar 2020 13:06:02 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com (2603:10b6:3:14a::16)
	by DM5PR18MB1226.namprd18.prod.outlook.com (2603:10b6:3:b2::13) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19;
	Tue, 31 Mar 2020 13:06:01 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::d1ec:4fbe:928d:8675]) by
	DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::d1ec:4fbe:928d:8675%9]) with mapi id 15.20.2856.019;
	Tue, 31 Mar 2020 13:06:01 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [RFC Patch 2/3] libmultipath: make sysfs_is_multipathed able to
	return wwid
Thread-Index: AQHWBwBFC6e+Bo9c3EKSlZjvstekm6hirD2A
Date: Tue, 31 Mar 2020 13:06:01 +0000
Message-ID: <5a85f7b0c9ef459ea8a7308dda4f21af8da687f5.camel@suse.com>
References: <1585620055-27112-1-git-send-email-bmarzins@redhat.com>
	<1585620055-27112-3-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1585620055-27112-3-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4
x-originating-ip: [92.211.129.134]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d14875f5-a951-4cb5-9824-08d7d574432f
x-ms-traffictypediagnostic: DM5PR18MB1226:
x-microsoft-antispam-prvs: <DM5PR18MB122678F0E7F940D279313B44FCC80@DM5PR18MB1226.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1388;
x-forefront-prvs: 0359162B6D
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DM5PR18MB1355.namprd18.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(10019020)(4636009)(136003)(366004)(346002)(376002)(39860400002)(396003)(8936002)(478600001)(6506007)(66446008)(76116006)(5660300002)(71200400001)(66556008)(64756008)(66476007)(66946007)(2906002)(2616005)(6486002)(26005)(81156014)(8676002)(91956017)(110136005)(6512007)(4326008)(81166006)(86362001)(36756003)(316002)(186003);
	DIR:OUT; SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +HLEfMOUPZvQkdC6zTt6MU7V8KIdCxXDkyfK9f8Oi7imPwnIZ/aSkM/jnZJfodPFaAZmbMJLJY5xPGPt/m+IiFDShjLo/x6OL+q0JrhRx6xEsvZ+8mYUVPloKhquFvlqcjBcjb8YGVUI3KRKOYMPXC40x8h4wWpgAX8okIhYIgHNvdFNFY1Z25VyQJYFRcnqHGsF3x8v2tXJ8IEsM7uKmVtfQVwuruSnaHuwczt6SEPX36E3xLNJ/Nzo3e+7H5J2R5QLO97NT4K6CJB7dNsVhY3p/4N/Q2cUJnZrOQiybTCW0wd5Wla0J8cM977WNzeB4Z/d/DDpfDjjOq2ix2wgcbkmqcuHXBiS+t+YtDhNaf5h/vvfWOWPQ+KMkCaOqPSp03IqYO8dAeuD91PoSK+qUtT8swqiJE6KpTNtw9TghbO8cAjFzipCKJvjqtrwIfK8
x-ms-exchange-antispam-messagedata: eqWS/zOIgyYAPEt+pcC99lnoQ7SRZk8OqTpTJuIU9HmqUCkCc0Jaqx6mCAJbbvbQk8X0Mg1r1kIx0uFNBgC2uekP4eXvMb0xspxH130FXsYp3p/aWmx70g0bGTRyc+TMEbIWRMErqeh+JTI085Snbg==
x-ms-exchange-transport-forked: True
Content-ID: <C11DDAE73E785349928526FA6AB18518@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d14875f5-a951-4cb5-9824-08d7d574432f
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2020 13:06:01.5310 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xVodE/4PzYnEVKZ7GAc6S2vRIvwfR8X8fW6HumYRdQnW9QrEAjbm6R1nHhN3HayfF1B+85MxBZEgtcI3pecvCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB1226
X-OriginatorOrg: suse.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02VDBsep007190
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [RFC Patch 2/3] libmultipath: make
 sysfs_is_multipathed able to return wwid
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-03-30 at 21:00 -0500, Benjamin Marzinski wrote:
> sysfs_is_multipathed reads the wwid of the dm device holding a path
> to
> check if its a multipath device.  Add code to optinally set pp->wwid
> to
> that wwid.  This will be used by a future patch.
>=20
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/sysfs.c | 22 +++++++++++++++++++---
>  libmultipath/sysfs.h |  2 +-
>  multipath/main.c     |  7 ++++---
>  3 files changed, 24 insertions(+), 7 deletions(-)
>=20
> diff --git a/libmultipath/sysfs.c b/libmultipath/sysfs.c
> index 62ec2ed7..034f082f 100644
> --- a/libmultipath/sysfs.c
> +++ b/libmultipath/sysfs.c
> @@ -295,7 +295,7 @@ static int select_dm_devs(const struct dirent
> *di)
>  =09return fnmatch("dm-*", di->d_name, FNM_FILE_NAME) =3D=3D 0;
>  }
> =20
> -bool sysfs_is_multipathed(const struct path *pp)
> +bool sysfs_is_multipathed(struct path *pp, bool set_wwid)
>  {
>  =09char pathbuf[PATH_MAX];
>  =09struct scandir_result sr;
> @@ -342,9 +342,25 @@ bool sysfs_is_multipathed(const struct path *pp)
>  =09=09if (nr =3D=3D sizeof(uuid) && !memcmp(uuid, "mpath-",
> sizeof(uuid)))
>  =09=09=09found =3D true;
>  =09=09else if (nr < 0) {
> -=09=09=09condlog(1, "%s: error reading from %s: %s",
> -=09=09=09=09__func__, pathbuf, strerror(errno));
> +=09=09=09condlog(1, "%s: error reading from %s: %m",
> +=09=09=09=09__func__, pathbuf);
>  =09=09}
> +=09=09if (found && set_wwid) {
> +=09=09=09nr =3D read(fd, pp->wwid, WWID_SIZE);

I'd rather read the whole UUID in a single syscall (i.e. merge this
with the previous read() that fetched the first 6 chars).

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

