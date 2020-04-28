Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 183571BCC62
	for <lists+dm-devel@lfdr.de>; Tue, 28 Apr 2020 21:27:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588102050;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hFVtdNimYi18hOkSJ0Qar0M8fqtWxS3DifYVbyQI98Q=;
	b=PwErSQCsIxRJ9RmoG/xeTg2OV/rBaHtjPCPfETil89+jgD2ftuEo2YHM1nVNn5zeks2a+6
	K+fFqJJIn90xVVAJpFqxcJwqgckR+AxfDRq3ZOkxFG/4WkDCxTzsK2njGR49p/MbUTans9
	MoOegETV/yzCpOCT935HnxC3iq38iw0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331--DJrbd4DOnaOKleIZxrJ5g-1; Tue, 28 Apr 2020 15:27:24 -0400
X-MC-Unique: -DJrbd4DOnaOKleIZxrJ5g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C78CC835B41;
	Tue, 28 Apr 2020 19:27:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 35EC860BF4;
	Tue, 28 Apr 2020 19:27:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7E2001809542;
	Tue, 28 Apr 2020 19:27:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03SJMx7N002219 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 28 Apr 2020 15:22:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E097F2156A3A; Tue, 28 Apr 2020 19:22:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DBA5B2156A23
	for <dm-devel@redhat.com>; Tue, 28 Apr 2020 19:22:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 152DA186E3A2
	for <dm-devel@redhat.com>; Tue, 28 Apr 2020 19:22:56 +0000 (UTC)
Received: from m9a0014g.houston.softwaregrp.com
	(m9a0014g.houston.softwaregrp.com [15.124.64.90]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-464-CE1g6-eKPVWv3qhApylQ9w-1;
	Tue, 28 Apr 2020 15:22:53 -0400
X-MC-Unique: CE1g6-eKPVWv3qhApylQ9w-1
Received: FROM m9a0014g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0014g.houston.softwaregrp.com WITH ESMTP; 
	Tue, 28 Apr 2020 19:22:13 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
	M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Tue, 28 Apr 2020 19:21:35 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (15.124.8.12) by
	M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Tue, 28 Apr 2020 19:21:35 +0000
Received: from DM5PR1801MB1883.namprd18.prod.outlook.com (2603:10b6:4:62::23)
	by DM5PR1801MB2010.namprd18.prod.outlook.com (2603:10b6:4:6a::15)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22;
	Tue, 28 Apr 2020 19:21:34 +0000
Received: from DM5PR1801MB1883.namprd18.prod.outlook.com
	([fe80::cd6:b672:d8d3:2710]) by
	DM5PR1801MB1883.namprd18.prod.outlook.com
	([fe80::cd6:b672:d8d3:2710%7]) with mapi id 15.20.2937.023;
	Tue, 28 Apr 2020 19:21:34 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [RFC PATCH v2 2/3] libmultipath: make sysfs_is_multipathed able
	to return wwid
Thread-Index: AQHWCYRHL0SjXbhlOEuyLtNsZraXn6iPEWoA
Date: Tue, 28 Apr 2020 19:21:33 +0000
Message-ID: <71c582d964fbb8fa6d2b3c87f30c641e050e19a7.camel@suse.com>
References: <1585896641-22896-1-git-send-email-bmarzins@redhat.com>
	<1585896641-22896-3-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1585896641-22896-3-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.1
x-originating-ip: [92.211.129.134]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a36b4ae1-369a-4659-76df-08d7eba95d24
x-ms-traffictypediagnostic: DM5PR1801MB2010:
x-microsoft-antispam-prvs: <DM5PR1801MB2010E0F492540354CB6FCD45FCAC0@DM5PR1801MB2010.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-forefront-prvs: 0387D64A71
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DM5PR1801MB1883.namprd18.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(366004)(346002)(39860400002)(376002)(136003)(396003)(5660300002)(86362001)(186003)(6512007)(478600001)(316002)(2616005)(110136005)(36756003)(76116006)(71200400001)(66446008)(6506007)(66476007)(66556008)(26005)(64756008)(6486002)(66946007)(91956017)(8936002)(4326008)(66574012)(2906002)(8676002);
	DIR:OUT; SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hXJHWyW5E99uhdm1LmzqrnD+VadN5vspGhMxnWkUAQXuqadES1W30yeSRnm40KnUAmst2ArlzbjCSoTqR5M/0MU9TG6r0kbCT3JVZHP854P5CjayYtZLulLtkWU9OB6ih1Zgz9Fb/7IvHqDMmOQquFVsBsBt5Yx43BIEMYAteJLTRlvq4CUwfuYcnzGCvKd0Ogruq5+jKOCoEBmNUBpDtAl+Y+JAw3EtIFr9b9IpvY1kAqa1p9Ov0w7YgVwBW0JlvEcK9b/cymMG80pqZDCsQab2Fj1uVsHQThdd+Bprjh77P9VEyFgZq3QU/g35rWZEib5k+N/llFRvQJ1YzEzcQRarbHw8u2BEMsUQFZ/vetO8Ih9ao61BH3+cboO390lPwDd2pyPRAaNznD1IswCkmmIgWKnJCR3En7lOLsjWTr+hvo1cvxBekl3TCgyfl0OT
x-ms-exchange-antispam-messagedata: A9p59Zrz9yPqAF31OnsGQkDAVnIZZl+QJZLR2xnwM+vOMCjoMUrrX3YLvBOopE50/vm1VjuZCYHW7rPG4R5tEt7TRzQsGiKA9ID+IHZT32zm24dhfxp5LOzp/XWc18YEM9Xy/WtPPekN4mLIwsmatICt/7Nfpu90ajVqBjSOv0NX0hCjmyhSI4o/JtR5QCOggOjP8GlTUT+K3xA1sT3xrZtTkqxIuxmhZX5pwUjYkcKb4WsSEi86u+anci7lW0T4I/gfke//ct7y8bFR+ngE6eem/QFk4dfX/0AB/GrEMzjDtI+52lMWxn4ESsg9Iq8WIptECfapfvrPFypFPz+fr+8j65RM0eT6ZSJGzChwbK3nx6duWu7lYyQ5dhdx4ZF+pumD1VVRhNdNUR42Tc3IKse4IgUUu662g894/q2UIfsZsEmcCOZlC2Y70qGNK1Rjw1mUc8QsbWnNUb7xKC2pTI1x119/bifY/Rn8P4SiafNIPG9l+0UiL5R+2YadDHroWT7UoUg1clRdLjRcHuFkd4rMOBGKGaoXSovbKv5EVTlZeGZUjVu6HOHgL+lTYnOrqMuiDL9t3IbOeCKVeFtrCS+uSoo26MPX/w9vdQcdVwLIsMp36D4VkfVSuyiS7G90TRTSG46NN5x2bNXX4z273nTB8EguOUj6ZHPiXEzOmzOOb5SbGWpVquceT0CVWMg7xVRb+ZnidODiRB3gVv2oRN8O/YhXOs0fjaHhEngJIvhPd6gkbDAML6AtW+oH3d16oVwAFHbutuI189JbaytB4EiqvBpyMsQjpQJZvnknmsk=
x-ms-exchange-transport-forked: True
Content-ID: <7D07CFDCB1C37E4580B8DA5B33E4A1C0@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a36b4ae1-369a-4659-76df-08d7eba95d24
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2020 19:21:33.9306 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QJXyc+wnQCeUuMIDsGz4eFAeBzb4ZDafuBHcWE1tKZs8GLw1N2y9FT3mNEFyVCcAiVegZV/WkCbpA99ojYAr9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1801MB2010
X-OriginatorOrg: suse.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03SJMx7N002219
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [RFC PATCH v2 2/3] libmultipath: make
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Fri, 2020-04-03 at 01:50 -0500, Benjamin Marzinski wrote:
> sysfs_is_multipathed reads the wwid of the dm device holding a path
> to
> check if its a multipath device.  Add code to optinally set pp->wwid
> to
> that wwid.  This will be used by a future patch.
>=20
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/sysfs.c | 24 +++++++++++++++++++-----
>  libmultipath/sysfs.h |  2 +-
>  multipath/main.c     |  7 ++++---
>  3 files changed, 24 insertions(+), 9 deletions(-)
>=20
> diff --git a/libmultipath/sysfs.c b/libmultipath/sysfs.c
> index 62ec2ed7..12a82d95 100644
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
> @@ -325,7 +325,7 @@ bool sysfs_is_multipathed(const struct path *pp)
>  =09for (i =3D 0; i < r && !found; i++) {
>  =09=09long fd;
>  =09=09int nr;
> -=09=09char uuid[6];
> +=09=09char uuid[WWID_SIZE + UUID_PREFIX_LEN];
> =20
>  =09=09if (safe_snprintf(pathbuf + n, sizeof(pathbuf) - n,
>  =09=09=09=09  "/%s/dm/uuid", di[i]->d_name))
> @@ -339,12 +339,26 @@ bool sysfs_is_multipathed(const struct path
> *pp)
> =20
>  =09=09pthread_cleanup_push(close_fd, (void *)fd);
>  =09=09nr =3D read(fd, uuid, sizeof(uuid));
> -=09=09if (nr =3D=3D sizeof(uuid) && !memcmp(uuid, "mpath-",
> sizeof(uuid)))
> +=09=09if (nr > (int)UUID_PREFIX_LEN &&
> +=09=09    !memcmp(uuid, UUID_PREFIX, UUID_PREFIX_LEN))
>  =09=09=09found =3D true;
>  =09=09else if (nr < 0) {
> -=09=09=09condlog(1, "%s: error reading from %s: %s",
> -=09=09=09=09__func__, pathbuf, strerror(errno));
> +=09=09=09condlog(1, "%s: error reading from %s: %m",
> +=09=09=09=09__func__, pathbuf);
>  =09=09}
> +=09=09if (found && set_wwid) {
> +=09=09=09nr -=3D UUID_PREFIX_LEN;
> +=09=09=09memcpy(pp->wwid, uuid + UUID_PREFIX_LEN, nr);
> +=09=09=09if (nr =3D=3D WWID_SIZE) {
> +=09=09=09=09condlog(4, "%s: overflow while reading
> from %s",
> +=09=09=09=09=09__func__, pathbuf);

I would have checked this condition before calling memcpy(), but that's
just a nit.

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

