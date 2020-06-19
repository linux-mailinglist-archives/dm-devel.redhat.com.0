Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id D6E9C201C05
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 22:10:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592597414;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KfM1C1OTinPfLmbHPSnNtM7Vi/Mnr0/T9qz82CaDHcU=;
	b=WvcaRv8rCBNAAPn8Feuiyiorb+laIwLO1ZEeujr7f7dO/NN7nCYc6Hscw2Y2SP+r7dZubu
	aLc+EsI/WQDEvEbDsoaMnRDPzlPcl5GIrq3WTlOn4Y5Fq//bU6+M/7odEST1tsU+MnIjdh
	6+1FSERBC73qG3v8NZNcz2UN+P4SNZw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-fAiAgh17MYaJ7ZuvW6JBPQ-1; Fri, 19 Jun 2020 16:10:12 -0400
X-MC-Unique: fAiAgh17MYaJ7ZuvW6JBPQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CB22100A8E7;
	Fri, 19 Jun 2020 20:10:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 86A5719C4F;
	Fri, 19 Jun 2020 20:09:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0100B1809547;
	Fri, 19 Jun 2020 20:09:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05JK9Zh3027567 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 16:09:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 816972157F23; Fri, 19 Jun 2020 20:09:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BB122166B27
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 20:09:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB28F8007C9
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 20:09:32 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr10054.outbound.protection.outlook.com [40.107.1.54]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-181-4LcZNUEQOLedjg-zy_XbfA-1; Fri, 19 Jun 2020 16:09:30 -0400
X-MC-Unique: 4LcZNUEQOLedjg-zy_XbfA-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB8PR04MB6378.eurprd04.prod.outlook.com (2603:10a6:10:3d::31) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23;
	Fri, 19 Jun 2020 20:09:27 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::d0dd:40e:5a9d:976e]) by DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::d0dd:40e:5a9d:976e%4]) with mapi id 15.20.3109.021;
	Fri, 19 Jun 2020 20:09:27 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>
Thread-Topic: [dm-devel] [PATCH 2/7] multipathd: fix check_path errors with
	removed map
Thread-Index: AQHWRQbcMR+kt/LI6U+LyjXcrZPwaajexPOAgAA+L4CAAPHXAIAANQoAgAA2/wA=
Date: Fri, 19 Jun 2020 20:09:27 +0000
Message-ID: <bfb3d1b613a5346fe57bfedac6b2b631f791c854.camel@suse.com>
References: <1592439867-18427-1-git-send-email-bmarzins@redhat.com>
	<1592439867-18427-3-git-send-email-bmarzins@redhat.com>
	<f09ec3b6537a7b7ac1ae26433e43846176f1dd48.camel@suse.com>
	<20200618231711.GM5894@octiron.msp.redhat.com>
	<6f9284eeec0dda69e8e4dd4b2858f02d3c31fb8b.camel@suse.com>
	<20200619165236.GP5894@octiron.msp.redhat.com>
In-Reply-To: <20200619165236.GP5894@octiron.msp.redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [88.73.133.3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1dcabd07-acf3-4da0-8ec0-08d8148cab43
x-ms-traffictypediagnostic: DB8PR04MB6378:
x-microsoft-antispam-prvs: <DB8PR04MB63781127A7605453CF62A373FC980@DB8PR04MB6378.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0439571D1D
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lxBzVA2U3/inXQyFlafoj1TK7shYYu9yaGjui6AidG/DUuQxPyUK/YT4gYhc+7Wzm8r2IqI9skJ/rKRmqve6m9TrL8YGJ4Ds6RJZB9C7Pzjjo1+KyG/KbEkotzsillZJSsOXwhxA2xku1zV9+jD5Mim4xs+BRjr/qMsjQ6yAmv0OkPxnVm214aRz3e8xUBZl+lmUkrr67Hrl33Ykt5UNOrHZ9IJOGeaIdek5riMvPM/zGNpo0dNfbvuGUuahTlrw0Em9iaZqbJfJW1/v9/tYz6nPuiXNs+/tp8x8d6yVyVPLys9F6hY28WiePkPV3kv+iy6TnUDJof8MB9OUKqnVDg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(366004)(39860400002)(396003)(376002)(136003)(346002)(83380400001)(478600001)(66556008)(66574015)(91956017)(316002)(66476007)(5660300002)(86362001)(71200400001)(64756008)(66946007)(76116006)(54906003)(66446008)(186003)(36756003)(6486002)(2906002)(6506007)(6512007)(8676002)(4326008)(8936002)(2616005)(26005)(6916009);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: csEfU2ZxgyAatopW7r3G0bnHjnbRV/PHoZWQYTW8rYVgE029ErASFeVvtYvmfd99igPV3jkMhAZmdUuf0N4e/tDF5qYD89HQJelqO09BK3Duzggd79P7t/NfXB8P71hcrGEGEApOkeSauu7xcKHT5n3KYYmaUK9XmrcWqoAVJjozZi9KMpPFIUbHR5FosSDUK2UPKuJAgDK5pYuUY4idJuRupRXlktDRz8OpPrboBPQexDnS8UDI8C75sn+1Gp9GUcfT8bV/g2S45RrdfOz0H+WBVvbk58y4LaqhQSFA9QRM1jHBl7RaRgBpdpZUw+tW5LFzKvY947uH3jp1C2EF3XvxD8+gssUlVeNOqJqdS36OhsNfcKKLm3nS+Jc6uD4Kg0OLOuQpJl8Yl0L6ljCmqRg7d5AiVCXhwnzQfnwzdOXWuQfWOvkN/raupZdR7/nk+3twdA82e4JwWtUfeE8azxqw5dX731JEYHRZ+VyV/bQ=
x-ms-exchange-transport-forked: True
Content-ID: <1D6385902A382E4B8B7EC24BC88DB210@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dcabd07-acf3-4da0-8ec0-08d8148cab43
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2020 20:09:27.3643 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dOj0miXy/19wEEKf31hqj7GUUbiZyKY3lHkD7qBlCyzwF4uthdQVJSQsnJgQrJ3/VlpSp4BV7PtTegM2zx9KLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6378
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05JK9Zh3027567
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 2/7] multipathd: fix check_path errors with
 removed map
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Fri, 2020-06-19 at 11:52 -0500, Benjamin Marzinski wrote:
> On Fri, Jun 19, 2020 at 01:42:47PM +0000, Martin Wilck wrote:
> > On Thu, 2020-06-18 at 18:17 -0500, Benjamin Marzinski wrote:
> > > On Thu, Jun 18, 2020 at 07:34:38PM +0000, Martin Wilck wrote:
> > > >=20
> > > > It would be more elegant if we could distinguish different
> > > > failure
> > > > modes from update_multipath_strings() directly, without having
> > > > to
> > > > call
> > > > do_dm_get_info() again.
> > >=20
> > > Seems reasonable. I'll take a look at that.
> >=20
> > Yet another idea: I just discussed this with Hannes, and he pointed
> > out
> > that right below this code, we have
> >=20
> > =09/* if update_multipath_strings orphaned the path, quit early */
> > =09if (!pp->mpp)
> > =09=09return 0;
> >=20
> > ... which could have the same effect, if pp->mpp was reloaded.
> > Probably
> > that doesn't happen because the pp->mpp dereference is cached in a
> > register, but we could simply add a READ_ONCE there.
>=20
> When update_multipath_strings() calls update_multipath_table() it
> will
> fail because the table no longer exists.  If we differentiate between
> a dm error and not finding the map, we can exit early without having
> to
> call do_dm_get_info() again. But right now, if the map is gone, but
> we
> haven't got the uevent removing it, then nothing will clear pp->mpp.=20

You're right. Let's "differentiate", then :-)

> If
> we did get the uevent, then it must have grabbed the vecs lock. That
> better have caused a memory barrier, which will guarantee that
> check_path() sees the updated value.

It could hardly have grabbed the lock while check_path() was running.
Anyway, this wasn't the right suggestion then, and "differentiating" is
better anyway. Sorry for the confusion.

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

