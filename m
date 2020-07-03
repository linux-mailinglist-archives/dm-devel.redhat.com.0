Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 04745213FA8
	for <lists+dm-devel@lfdr.de>; Fri,  3 Jul 2020 20:51:15 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-E-RnNIcJOtq2cNtIn2gcCw-1; Fri, 03 Jul 2020 14:51:12 -0400
X-MC-Unique: E-RnNIcJOtq2cNtIn2gcCw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4590A800597;
	Fri,  3 Jul 2020 18:51:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A7B05BACF;
	Fri,  3 Jul 2020 18:51:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F2FF26C9CA;
	Fri,  3 Jul 2020 18:50:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 063IoZJx010670 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 3 Jul 2020 14:50:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 006C8207B426; Fri,  3 Jul 2020 18:50:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF45B207B428
	for <dm-devel@redhat.com>; Fri,  3 Jul 2020 18:50:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D5208007A4
	for <dm-devel@redhat.com>; Fri,  3 Jul 2020 18:50:32 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [51.163.158.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-253-5d9-aipDN_OV8uNvR7MwIQ-1;
	Fri, 03 Jul 2020 14:50:30 -0400
X-MC-Unique: 5d9-aipDN_OV8uNvR7MwIQ-1
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-7-gbmeKUTYOgOdxl2cHD3K5g-1; Fri, 03 Jul 2020 20:50:27 +0200
X-MC-Unique: gbmeKUTYOgOdxl2cHD3K5g-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB6PR04MB3000.eurprd04.prod.outlook.com (2603:10a6:6:b::21) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.3131.26; Fri, 3 Jul 2020 18:50:26 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::8130:53b2:48d5:593]) by DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::8130:53b2:48d5:593%3]) with mapi id 15.20.3153.028;
	Fri, 3 Jul 2020 18:50:26 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "snitzer@redhat.com" <snitzer@redhat.com>
Thread-Topic: [dm-devel] [PATCH 0/7] Fix muitpath/multipathd flush issue
Thread-Index: AQHWUWET2l0TZNBxQkS1qsaRuRy/yqj2MtwA
Date: Fri, 3 Jul 2020 18:50:26 +0000
Message-ID: <11f2c30ae0c94ce76e1bf110e8bc599cc7ddd832.camel@suse.com>
References: <20200618180458.GI5894@octiron.msp.redhat.com>
	<c5e95e7bc75b11e811854ff0b0988ff19ef45e13.camel@suse.com>
	<20200618230625.GJ5894@octiron.msp.redhat.com>
	<5357998bd17e1147fd3a6615e03251d1aa4900d8.camel@suse.com>
	<20200702031449.GB29962@octiron.msp.redhat.com>
	<8158d509bca2cae483d553defdd1eb378c16d813.camel@suse.com>
	<20200702151829.GA11089@octiron.msp.redhat.com>
	<cd568c7aabaa102db8ef6ba8ceb87b96d62f632c.camel@suse.com>
	<20200702194128.GG11089@octiron.msp.redhat.com>
	<be1e8d96543bc86a6a194bb9c708fba91878d9c9.camel@suse.com>
	<20200703163909.GA7187@redhat.com>
In-Reply-To: <20200703163909.GA7187@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3
x-originating-ip: [94.218.227.113]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9b6455f6-edbb-465a-6810-08d81f81f30e
x-ms-traffictypediagnostic: DB6PR04MB3000:
x-microsoft-antispam-prvs: <DB6PR04MB3000F5313657EE3D089E7280FC6A0@DB6PR04MB3000.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 045315E1EE
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NXSo+BFu/REAhKYF3uXgWY9vH8Wr6YZMj10YNMRyzr2kCMg+x+G5LqAyU0qj1E8iyQ1RQXh3d3dRYsqRNeuIrAZ+H9t03BgLrEJ0xpmn6WjVVTxbdo0cxs9OAa7PLFanJTcKpFqbcwvubAD27RkRmI+iWnzav0Nx4gE8/JTEFM83VE06SFz6Z/Ery8aIHyZ2KdbGfirFhTP98WzDsG1WxPNZ8fMyljQcI19nkeX2G+UIpSj1pTABt7aGpz4VCPazJMsSOTRQSN563dryEtapyY5dtGgQwBEUmH49vjSSm6+C0dnfavf1EDgBYkWTbM3h
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(136003)(39860400002)(376002)(346002)(396003)(366004)(66476007)(450100002)(4744005)(36756003)(6512007)(478600001)(66946007)(71200400001)(66446008)(66556008)(6486002)(64756008)(4326008)(2616005)(8936002)(86362001)(66574015)(5660300002)(26005)(76116006)(316002)(83380400001)(8676002)(2906002)(6506007)(6916009)(186003)(54906003)(91956017);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: 4WF9A3xoTxhKe1Ul8B8rwpIm4PDEt6BSsCyERpCg+Njxgfs791GbPBeSVcnebVA4N2Hv8KBFgD8a49cyur5fCnpk56XS0Q+Nk3L5MbFpGs7rwZXaIgSwnrxiq9hF8t7xOG7lU4EE9vJyDP8tF4Lkz0exaAiRmkYREya8S+Sl9pv3J54frul2bWVx/90mfxnHBSUQc8yF4/EJl1NHWjr4IqcLJKjm7dcOOzX5rq0LnkfpdaAA7NNw4KiAheU4KSkuwiRWHQvKpTSxpAx1W76GvPEeXH7gvhXAFshWebcyGANJjDMKJBpeX5+IOxC19QThQg0LbwSCKDX7+4wRmu6ZxX7x7uwn2cIxTydgXy/VOK38sfA3mQrqdj76qoL4MKSSbwQ2DdUEkt86XOXSVP9Ss0DRhJF6Gur+Em4VeAKtxorVIOX2T9vdpryJ4m4GwOnq9TZBi1uO4tGS9+9xFIhPjh9Ebk84wx41mdzb584tncNAEQn276k54wgaWZMTlpSQ
x-ms-exchange-transport-forked: True
Content-ID: <EE61EAF43CE96F48899739D2EF44C8E4@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b6455f6-edbb-465a-6810-08d81f81f30e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2020 18:50:26.1235 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9th1AQ1fvpfmXpPHN1Yo+yJVj2Vi4A/NsPWWpLjsgEVXd5RJVZLCrlVteKOXcEsSoIyow5WZlZDwtMWXyctF2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3000
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 063IoZJx010670
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"zkabelac@redhat.com" <zkabelac@redhat.com>
Subject: Re: [dm-devel] [PATCH 0/7] Fix muitpath/multipathd flush issue
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Fri, 2020-07-03 at 12:39 -0400, Mike Snitzer wrote:
>=20
> Docker couldn't have later opens fail due to a pending removal --
> it'd
> break their app.  So if you want it to do what you'd have imagined it
> to
> be; we'll need to introduce a new flag that alters the behavior
> (maybe
> as a module param off of DM core's dm-mod.ko).  Patches welcome --
> but
> you'll need a pretty good reason (not read back far enough but maybe
> you have one?).

Thanks a lot for the explanation. I don't think I'm going write patches
and reason about it. We were just looking for the best way to safely
flush maps in multipath-tools, and I'd considered deferred remove as
one option, which it most likely is not. Anyway, I like to understand
why thinks are the way they are, so thanks again.

Cheers,
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

