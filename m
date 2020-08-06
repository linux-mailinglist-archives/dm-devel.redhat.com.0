Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id EEDBD23D984
	for <lists+dm-devel@lfdr.de>; Thu,  6 Aug 2020 12:59:20 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-rPDPELPxOXaQIUJGZwT_rg-1; Thu, 06 Aug 2020 06:59:17 -0400
X-MC-Unique: rPDPELPxOXaQIUJGZwT_rg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2417E8015F0;
	Thu,  6 Aug 2020 10:59:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 855407B93D;
	Thu,  6 Aug 2020 10:59:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A0AA01809547;
	Thu,  6 Aug 2020 10:59:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 076AwxHE000634 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 6 Aug 2020 06:59:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A0D53F51BA; Thu,  6 Aug 2020 10:58:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 85364F51BC
	for <dm-devel@redhat.com>; Thu,  6 Aug 2020 10:58:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3EBC78007B3
	for <dm-devel@redhat.com>; Thu,  6 Aug 2020 10:58:56 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [51.163.158.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-263-LcYCICL8OCC2XK8sg4ZSrQ-1;
	Thu, 06 Aug 2020 06:58:53 -0400
X-MC-Unique: LcYCICL8OCC2XK8sg4ZSrQ-1
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
	(mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-3-iC79g7egPCG6gOrY5My-ag-1; Thu, 06 Aug 2020 12:58:51 +0200
X-MC-Unique: iC79g7egPCG6gOrY5My-ag-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB7PR04MB4923.eurprd04.prod.outlook.com (2603:10a6:10:1c::19) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16;
	Thu, 6 Aug 2020 10:58:50 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::8130:53b2:48d5:593]) by DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::8130:53b2:48d5:593%3]) with mapi id 15.20.3261.019;
	Thu, 6 Aug 2020 10:58:50 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 0/6] multipath cleanups
Thread-Index: AQHWZEuYlqZrJ2BfuU6YbcL4siVPkKkq+ImA
Date: Thu, 6 Aug 2020 10:58:50 +0000
Message-ID: <75f9dc44f24e4ff5923ba3bc5cb44f29635afb62.camel@suse.com>
References: <1595877868-5595-1-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1595877868-5595-1-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.4
x-originating-ip: [90.186.231.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf77776d-2c1e-4852-8004-08d839f7b387
x-ms-traffictypediagnostic: DB7PR04MB4923:
x-microsoft-antispam-prvs: <DB7PR04MB492331BBC04AD782BBCE6107FC480@DB7PR04MB4923.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qS4GyvH4/oc6QSVThdsI2ociewJJFYl0lqiVT7mUK4sKsQjyaXGMlejZ3pG9F56ZryCKOpBQCKkoR8Giz0N432AQv13pbYBE4AdEC3JfJJHzdwQItqw7UVEVumzWkr4tI42B3OM92UWoj+qwyxIkspVME3E1FdA8PWozNnm3Y0DXGYLB2CgQMuHZIMT5lZ33e9O4FyyEyqQxc00hGzTGHQe7Is8qc0QPI6VdmBrIUFDYUMyH3gQ0pNH7kNEzDBx9kF9+4BrUdbYx6ZFFWdCBLORAyiNusCabiXC6Vtqp6ORj35tiAhb8ePZm7f8cQQ9vyV7Admeh4rk8+YHMhIqxog==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(366004)(346002)(136003)(376002)(396003)(39860400002)(26005)(2906002)(83380400001)(316002)(6486002)(2616005)(66574015)(6512007)(4326008)(6506007)(478600001)(36756003)(86362001)(8936002)(71200400001)(66446008)(91956017)(8676002)(186003)(76116006)(110136005)(5660300002)(66476007)(66946007)(66556008)(64756008);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: dvgkCoJzh42n7RYnO39j3WIhjFtA0sW4IaLpglhZegQTYxDLqeppfg/DI35Q/CQoqJpsfmVF3i5daqE6lIVKUOEhefvgBpy6Q/Z1jviuCeR9fM15vKEGvaoCLFpHXRrSj7VcsSok2jvKymh1b/vNJ8E3LOSE4Bl9KUoEiI3rOZGlwRunIT0eIyv3YKvj0NT0UmHyioOz5DNGu06ofy1RgXzpOQY0r50K7QZHaiXenYCfwXXGijdhrOJ8ofQTAym8vkNov0UGYg2Mr6MN+hfMi8fNpzaOjRvm5xsbj2puhmr+4ou5rECqnG8ScfLjiYml1kvBP6QKu1wk+t3+0JV+fw7PWH0dm5YrlHJEfpWpk2whBufT1uoVJxECkFOMaCUQ2oqnmc3bFizlKnR76J7wNBph97em1w9pctUeRm9l/xslQuRYgQVndQFGmeRgqw5cPu2Y6XFxTqHquXm9MAJ7AYhcXUZZXyvtbuyOYAB2eqSm5A/HixqQd0k9wFrmNsnJOAqVvfvhsn8URCVQV996eWCwZxJNGz9t7KdlUo13+kPDK0R/okp8r0SmTz4q52ODt5iFUqGh6Gv81xLBUFnnGm7bIezR5qIY7XhRKXVjq69mVjW15ZZGJrTPxfDJHAUS+j8OKHlnUTg1JD4HVFb8Sg==
x-ms-exchange-transport-forked: True
Content-ID: <45963B8C4183444EA50BFFE78EBAB8F5@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf77776d-2c1e-4852-8004-08d839f7b387
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2020 10:58:50.3413 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 78x8O1E69O0l3Yw1MRpnJAEWAwiX9a6rnIjotIocCbp7+Ntln5tLtu5RlmeBbyWuIcqrGRC5+15UC59q3ItiQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4923
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 076AwxHE000634
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 0/6] multipath cleanups
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-07-27 at 14:24 -0500, Benjamin Marzinski wrote:
> Patches 0003 & 0004 fix an issue that I've seen with paths whose
> checker
> takes too long when multipathd is starting up and creating devices.
>=20
> The others are minor build fixes or small cleanups to my previous
> patchset.
>=20
> Benjamin Marzinski (6):
>   Makefile.inc: trim extra information from systemd version
>   kpartx: fix -Wsign-compare error
>   libmultipath: remove code duplication in path counting
>   libmultipath: count pending paths as active on loads
>   libmultipath: deal with flushing no maps
>   multipath: deal with delegation failures correctly
>=20
>  Makefile.inc                    |  2 +-
>  kpartx/kpartx.c                 |  2 +-
>  libmpathpersist/mpath_persist.c |  4 +--
>  libmultipath/devmapper.c        |  5 ++--
>  libmultipath/structs.c          | 52 ++++++++++++++++---------------
> --
>  libmultipath/structs.h          |  2 +-
>  multipath/main.c                |  9 ++++--
>  7 files changed, 39 insertions(+), 37 deletions(-)
>=20

For the series, except 3/6:

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

