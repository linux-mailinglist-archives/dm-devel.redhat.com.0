Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 2537124279F
	for <lists+dm-devel@lfdr.de>; Wed, 12 Aug 2020 11:32:01 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-6NvXyguUPEeD6NxxxJ_chg-1; Wed, 12 Aug 2020 05:31:58 -0400
X-MC-Unique: 6NvXyguUPEeD6NxxxJ_chg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7AC21005E5D;
	Wed, 12 Aug 2020 09:31:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 87B0F5D9DD;
	Wed, 12 Aug 2020 09:31:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3AC0F180B656;
	Wed, 12 Aug 2020 09:31:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07C9VfIE015040 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Aug 2020 05:31:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C9F8ED1BA8; Wed, 12 Aug 2020 09:31:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C49A7D0B57
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 09:31:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1E2680088F
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 09:31:39 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [51.163.158.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-133-cZ55kSfWMz6aHK-ANuUeuA-1;
	Wed, 12 Aug 2020 05:31:37 -0400
X-MC-Unique: cZ55kSfWMz6aHK-ANuUeuA-1
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur03lp2058.outbound.protection.outlook.com [104.47.10.58])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-13-B4t-ph1gMdeIj4tYzu6gdg-1; Wed, 12 Aug 2020 11:31:34 +0200
X-MC-Unique: B4t-ph1gMdeIj4tYzu6gdg-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB7PR04MB4746.eurprd04.prod.outlook.com (2603:10a6:10:15::16) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18;
	Wed, 12 Aug 2020 09:31:33 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::8130:53b2:48d5:593]) by DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::8130:53b2:48d5:593%3]) with mapi id 15.20.3283.015;
	Wed, 12 Aug 2020 09:31:33 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH v2 0/8] multipath cleanups
Thread-Index: AQHWcCqcMoIHpELiREGx7he4qTg1OKk0NmUA
Date: Wed, 12 Aug 2020 09:31:33 +0000
Message-ID: <2f55ef8f7d5178f14cf40af4171d4ced6df21884.camel@suse.com>
References: <1597183123-15797-1-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1597183123-15797-1-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.4
x-originating-ip: [90.186.0.118]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 589294ab-f0f4-4828-a176-08d83ea28083
x-ms-traffictypediagnostic: DB7PR04MB4746:
x-microsoft-antispam-prvs: <DB7PR04MB47468EC36173491621029193FC420@DB7PR04MB4746.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1gq+x5S03HLuwNOX0MSRrNDhPCO5y3aKIqCQcJAdNW+NiOpOt1yQG6jByU/schoQzOTDjljS30khqHXxoSfw6f5O5noWCRB4VG+w2yg2YvRnrkKCwJ8GCx6Auy1ttjdlPWDDgdYXmNjXv4wd8YLs+CIP1og16k5dVUesmlaEejhH5ayV7hAxzl4nh+G7ndH6CGHzh4MbSUHSx1O/arzXMJ8g+ebQlKqsYl292PxR8/cQ98CIX8809NeOQw5qtrBCUG15TSIGje/IQrNRkChOKtPULL4bIcOy8bqQ01VH12TyKoCQCgh+i1eX1sELnJ7McYcy17Wrma2Y7teFI8rNGQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(366004)(39860400002)(136003)(346002)(376002)(396003)(2616005)(8936002)(26005)(66476007)(6506007)(4326008)(5660300002)(66574015)(66446008)(2906002)(6486002)(76116006)(186003)(83380400001)(66556008)(64756008)(86362001)(66946007)(110136005)(36756003)(71200400001)(478600001)(8676002)(91956017)(6512007)(316002);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: A7+f9vV02YTGGgezsug0FrnJJFSiLghVPtXmwqRZdlt9C2aEX7r+dop5EfaO0RpWuKJm9sOmi47qJSAEQe9TVFXCHD3Ab+OgF171p9J0QLIyZOs6/NUiX+/0n+p1SpeusrOA5sO1a/iXNVH4N/i7yxewvnf5GifL2ltOyq//Gdn4R6yBPDwtxe4Tbbnm31Y4I2bEuqe0S41aPfZE1yDqYwtgd9gmoccTK7UydgjNzDljcZ8Vq60TeLjuptWhfcszuMxmKEWzljqVZvagYLscgNIlcM3/mJXMWY0ICzvU9BbXeYP9Kgfi5zeZN0xO8gx7zxZEj407TdzRN/9aVi1lP9h6ecgEsqsPAZURR5sJPaHWtVaxGYul0RBo90G03XQwEy/u2hH3RcLMEOK8avOufxeE5iZbreTSxmYz3kVbYJWX7T9RdWS0wyOq4zy/W2lcJQ57A2bVpcylUjId09H4nxJYWSKUOqCQyC0QxMfG5X1JMFDJOa0EtLJfLtDJ6jT4Km4YduNGkzYugHteBlamdz4Mhkkh9RZx/UI076TiRKRkwIxua40zZRcACULjV6UqSBpyyJrTaibPi5XpeNBUZ5OfVoVXB9xQikK0AOo0T1vg3BH3gZzWxrhcORvqV84PThnNp6V5pJ1nWzN27J5tgA==
x-ms-exchange-transport-forked: True
Content-ID: <5C95B521B326B045AB914BA12F591251@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 589294ab-f0f4-4828-a176-08d83ea28083
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2020 09:31:33.4039 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NUxyQkbY1uGZ1LujoVwathEzOlLkRzTu+R59latKvEoBzUaM/UEkT8lCRnQzSc6Z5cQILit0tx8rHzcxTZMbrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4746
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07C9VfIE015040
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH v2 0/8] multipath cleanups
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
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-08-11 at 16:58 -0500, Benjamin Marzinski wrote:
> Patches 0003 & 0004 fix an issue that I've seen with paths whose
> checker
> takes too long when multipathd is starting up and creating devices.
>=20
> The others are minor build fixes or small cleanups to my previous
> patchset.
>=20
> Changes in v2:
> - patch 0003 no longer refactors count_active_paths(), as suggested
>   by Martin Wilck
> - Added patches 0007 & 0008, which are both unrelated minor changes.
>=20
> Benjamin Marzinski (8):
>   Makefile.inc: trim extra information from systemd version
>   kpartx: fix -Wsign-compare error
>   libmultipath: refactor path counting
>   libmultipath: count pending paths as active on loads
>   libmultipath: deal with flushing no maps
>   multipath: deal with delegation failures correctly
>   multipathd: unset mpp->hwe when removing map
>   multipathd: log reason for calling domap()
>=20
>  Makefile.inc                    |  2 +-
>  kpartx/kpartx.c                 |  2 +-
>  libmpathpersist/mpath_persist.c |  4 ++--
>  libmultipath/devmapper.c        |  5 +++--
>  libmultipath/structs.c          | 38 +++++++++++++++++++++--------
> ----
>  libmultipath/structs.h          |  2 +-
>  libmultipath/structs_vec.c      |  1 +
>  multipath/main.c                |  9 +++++---
>  multipathd/main.c               | 14 ++++++++----
>  9 files changed, 49 insertions(+), 28 deletions(-)
>=20

For the series, except 7/8 "multipathd: unset mpp->hwe when removing
map":

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

