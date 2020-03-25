Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id DC689192CBD
	for <lists+dm-devel@lfdr.de>; Wed, 25 Mar 2020 16:38:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585150703;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bgC1SV6rCJ5Xg3vMOtCqeQnJyn91lHEkDwx9SjN/rpw=;
	b=Q+QoYHh86MSmPYfxOsYP7A2K9B4Visk2Jl30Khz0hjkAtc4uaGnia/YjLvxcpGaRr6ySrm
	rT9epcL16pPHrT6TZPGStR1FM4bC1vDLl5XSIhKGhGLOaxL2DXKsyjrN4bxS7k0sGvIbVR
	a5Zw+m3fSjZxfrEowPDs8LdBJEpuc80=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-i3nPZL90PD-r2ixg7WwT0w-1; Wed, 25 Mar 2020 11:38:21 -0400
X-MC-Unique: i3nPZL90PD-r2ixg7WwT0w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4433618C35AA;
	Wed, 25 Mar 2020 15:38:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E1CC15C1B0;
	Wed, 25 Mar 2020 15:38:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DE68686386;
	Wed, 25 Mar 2020 15:38:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02PFc0F3012613 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 25 Mar 2020 11:38:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2E1AC20316E9; Wed, 25 Mar 2020 15:38:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2710520316F5
	for <dm-devel@redhat.com>; Wed, 25 Mar 2020 15:37:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8E60101A55F
	for <dm-devel@redhat.com>; Wed, 25 Mar 2020 15:37:57 +0000 (UTC)
Received: from m9a0013g.houston.softwaregrp.com
	(m9a0013g.houston.softwaregrp.com [15.124.64.91]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-408-oFt-DiFhNP-orgmSrxq1Cg-1;
	Wed, 25 Mar 2020 11:37:53 -0400
X-MC-Unique: oFt-DiFhNP-orgmSrxq1Cg-1
Received: FROM m9a0013g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0013g.houston.softwaregrp.com WITH ESMTP; 
	Wed, 25 Mar 2020 15:36:59 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Wed, 25 Mar 2020 15:27:48 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (15.124.72.12) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Wed, 25 Mar 2020 15:27:48 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com (2603:10b6:3:14a::16)
	by DM5PR18MB1514.namprd18.prod.outlook.com (2603:10b6:3:145::16) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22;
	Wed, 25 Mar 2020 15:27:47 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::d1ec:4fbe:928d:8675]) by
	DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::d1ec:4fbe:928d:8675%9]) with mapi id 15.20.2856.019;
	Wed, 25 Mar 2020 15:27:47 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 3/3] libmultipath: allow force reload with no active paths
Thread-Index: AQHWAh/cMI0ylGKxIUi3juB+00Seh6hZb6EA
Date: Wed, 25 Mar 2020 15:27:47 +0000
Message-ID: <8cf9474c678b92663c1b7a64a9018d4c75abddff.camel@suse.com>
References: <1585083834-14237-1-git-send-email-bmarzins@redhat.com>
	<1585083834-14237-3-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1585083834-14237-3-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4
x-originating-ip: [92.211.129.134]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7bfa2947-e725-4fea-139e-08d7d0d11278
x-ms-traffictypediagnostic: DM5PR18MB1514:
x-microsoft-antispam-prvs: <DM5PR18MB1514BD121352D8F8CC4E598EFCCE0@DM5PR18MB1514.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0353563E2B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(66556008)(36756003)(81166006)(66946007)(86362001)(8676002)(6486002)(6506007)(91956017)(66476007)(64756008)(66574012)(81156014)(6512007)(76116006)(110136005)(66446008)(4326008)(26005)(186003)(316002)(8936002)(2906002)(71200400001)(478600001)(2616005)(5660300002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB1514;
	H:DM5PR18MB1355.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CIhU8+s219umS5nYIE/P5dG+Tlx7n66O6ecUWDd5Yta3T1tILlbbA0zZNu0HkrOVYyH3HDcqXGJCtTkFabLYtuSQh+3uiMECWGBNKQzt/e1x8cuU/QgtndvoDQktIhImIwPlrkjDcK7R0t6jaLTqNkGNshBpiBYxDNqK/mTrzhVgz4xqkdCtxLApenXzRlr+c4LUrTKEYFrLSZzzPDIi/CgaVck4j0r2MqHiUnoBmj6Ig1pQDmUrDpkSsW+S472PbNbUlpDOkFED+OncEkl4D53N5mNye/c/FeLM/UOVJSqZSGgP/Im3NQHWiCMwtLMjU17gFlxmr0zAI4y9Vw6J8eRLCB3CDMYBLyCXBBtXdULv4uO2O+GlTZc3lFZyiDFuLfIA6wBExuC/zntv4IVTbmHped3KPsUumdzWvI7eBhWfYBY2/pVlfiSfnNIZzfaV
x-ms-exchange-antispam-messagedata: XxP1gpiBRHV66sd8bfiS+Gm1EMn2nDYHeacPIAKlQXHEAU7fk/kX4J8Yt4sAX5XGGZCjsS+ISyzZszqigZ/tXS54nDdhsWEiQnmC8NG9os9ijcKROdENw7tY9xxPY1mQMl8Cy6vp3E6FBvzAxwkFGA==
x-ms-exchange-transport-forked: True
Content-ID: <A0A96F79F607864BB015B38E51493E70@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bfa2947-e725-4fea-139e-08d7d0d11278
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2020 15:27:47.1566 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jRbPt9koY1OqwuDgjPO5m5I6NyGKirAWGeRv9bxTH+Z2C16DAHxcqN8KUr6+ifgIfawZXu6Zv/Fc/WtCLHwNHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB1514
X-OriginatorOrg: suse.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02PFc0F3012613
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 3/3] libmultipath: allow force reload with no
	active paths
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

On Tue, 2020-03-24 at 16:03 -0500, Benjamin Marzinski wrote:
> If the partition information has changed on multipath devices (say,
> because it was updated on another node that has access to the same
> storage), users expect that running "multipathd reconfigure" will
> update
> that.  However, if the checkers for the multipath device are pending
> for
> too long when the the device is reconfigured, multipathd will give up
> waiting for them, and refuse to reload the device, since there are no
> active paths. This means that no kpartx update will be triggered.
>=20
> Multipath is fully capable of reloading a multipath device that has
> no
> active paths. This has been possible for years. If multipath is
> supposed
> to reload the device, it should do so, even if there are no active
> paths.
>=20
> Generally, when multipath is force reloaded, kpartx will be updated.
> However when a device is reloaded with no paths, the udev rules won't
> run kpartx.  But they also weren't running kpartx when the first
> valid
> path appeared, even though the dm activation rules get run in this
> case.
> This changes 11-dm-mpath.rules to run kpartx when a device goes from
> no
> usable paths to having usable paths.
>=20
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/configure.c    | 6 ------
>  multipath/11-dm-mpath.rules | 2 +-
>  2 files changed, 1 insertion(+), 7 deletions(-)

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

