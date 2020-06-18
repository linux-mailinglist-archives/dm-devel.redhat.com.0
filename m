Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 8F4901FFCC1
	for <lists+dm-devel@lfdr.de>; Thu, 18 Jun 2020 22:41:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592512897;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ILSrCfn9/YANqJN8U11msETfhb3sS6U3q6tmnfLthnY=;
	b=M+/x9wDuwHw5Qy+i1z1rEI9tL8az3rBPZIzfwVmV5dAvJ8u5G25/aiW2Cr72u6VRn5n4kD
	r3sYMFj+YgDQeJN3ZzdxOoxiOnzRjgMWUbNM5UNJ6ahWdznmRFJYfybgAf3I7+rfKP02Tx
	1xikyJQFqwBS99N4eSpuL97C5ahWDWY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-2J6BKGhcMA-OTbvIwPrZxA-1; Thu, 18 Jun 2020 16:41:35 -0400
X-MC-Unique: 2J6BKGhcMA-OTbvIwPrZxA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8C0E107ACF3;
	Thu, 18 Jun 2020 20:41:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A88AE1002388;
	Thu, 18 Jun 2020 20:41:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 19AC31809547;
	Thu, 18 Jun 2020 20:41:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05IKeANO030282 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 18 Jun 2020 16:40:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8E8682156A2D; Thu, 18 Jun 2020 20:40:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 889382166BA3
	for <dm-devel@redhat.com>; Thu, 18 Jun 2020 20:40:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDF318007DD
	for <dm-devel@redhat.com>; Thu, 18 Jun 2020 20:40:07 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
	(mail-eopbgr60059.outbound.protection.outlook.com [40.107.6.59]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-7-5vcf9fduNfakhXpQ-tHHwA-1; Thu, 18 Jun 2020 16:40:02 -0400
X-MC-Unique: 5vcf9fduNfakhXpQ-tHHwA-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB8PR04MB5881.eurprd04.prod.outlook.com (2603:10a6:10:a7::20) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19;
	Thu, 18 Jun 2020 20:40:01 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::d0dd:40e:5a9d:976e]) by DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::d0dd:40e:5a9d:976e%4]) with mapi id 15.20.3109.021;
	Thu, 18 Jun 2020 20:40:01 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 6/7] multipath: delegate flushing maps to multipathd
Thread-Index: AQHWRQbiGo0egctslkKJcOJpjtMPaqje1zcA
Date: Thu, 18 Jun 2020 20:40:00 +0000
Message-ID: <43790384e0a4ad88768dfe8147a63fb6f8926bc2.camel@suse.com>
References: <1592439867-18427-1-git-send-email-bmarzins@redhat.com>
	<1592439867-18427-7-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1592439867-18427-7-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [88.73.133.3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1fc4a1e9-93c2-4e93-2277-08d813c7c5c1
x-ms-traffictypediagnostic: DB8PR04MB5881:
x-microsoft-antispam-prvs: <DB8PR04MB58810F874EB99176D38F3F5FFC9B0@DB8PR04MB5881.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0438F90F17
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hExl4vxU+llYHIK8pWXxEsbnqthAW6Z+KXnOruftMRAZa0jeoQlOvMNnYszjqC4887geJcXto5c2iGez+gEhQu4QYN4uegRZdl0ObCIptQDK4KrBpz44KQ+5NdLsxDEWyYDF704+P07hhB4719WRAEihp02s6DO0gt8HS/MrhDp5NiqIDn20ABGH4su2HguqiEO1dr5UKg9Jvr4thn7C7q7kHKnUaQEPpMkW17L6xQ39qMTr31/i6fxJSWirzY1YnwDbuoC6hBEZ5sFnb4HDTtZQcjoDFwEpaxoZdua8tHB3fzKtUbOS9uiuvQBmwuUk
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(366004)(39860400002)(376002)(136003)(346002)(396003)(316002)(508600001)(4326008)(76116006)(8676002)(66446008)(2616005)(4744005)(6506007)(6486002)(91956017)(6512007)(66556008)(36756003)(110136005)(66476007)(66946007)(64756008)(8936002)(5660300002)(186003)(2906002)(86362001)(83380400001)(26005)(71200400001)(66574015);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: orJQmQhfYKU6fLt+KbRjNlpfPLFwfr04SPI8YmjgBoUz/A85wSs259YX0KTsked0XNFJxEnkWK3zrmBc+dZmtjlnRrAl8OuYdm1kZjVRJ8fp1iyAecnnc0T/htFMzTWyyVTLL2eZHMH/aFF1a0zSdeQyotQRYGqbM2cbMxtsIucdNxbXm/AqHUxBe0Ozo6DzzOrMqs1SiP7Wckz5jwquxVdIDAmM+phd1PHq6uHg5mkvLZsRpUzPJa5b4Nbi19a4jF6PtWD81kKbhvSj6WkDw1kIHSlLpwXcay+fHj1i5uF1VBftsB3f8uKUDJVkZcw/0TSl3M55N1tds6FduTJMuJtB08TN4eTBiEeYDpno/VF5/M7T9FaMg3DxfdrCil9zM99sdzwXDkbU9Re1omuk+W1fDlTbeZDS7cG2xlvX8vgQyEmZtQkOm3wliRrs1TB9QCuuxR8VQz57yFl8SyyKBv6MJQtHybA6/rLMi9JhV5k=
x-ms-exchange-transport-forked: True
Content-ID: <F739BBA50FB4D64D81FA7C7E7204DF0B@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fc4a1e9-93c2-4e93-2277-08d813c7c5c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2020 20:40:00.8844 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IqKrXeTgEJ2PT7SVe+3UX8Nn4mmfjFOdAA6dSCir+yafYEUbPUJrhRXpQWOoCRpX/YE5/acvQCRALjew30YMcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5881
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05IKeANO030282
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 6/7] multipath: delegate flushing maps to
	multipathd
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

On Wed, 2020-06-17 at 19:24 -0500, Benjamin Marzinski wrote:
> Since there can be problems with removing maps outside of multipathd,
> multipath should attempt to delegate this command to multipathd.
> However, multipathd doesn't attempt to suspend the device, in order
> to avoid potential hangs. If delegating to multipathd fails,
> multipath
> should try the remove itself.
>=20
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>

Reviewed-by: Martin Wilck <mwilck@suse.com>
(but see remark on patch 4/7).

--=20
Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
SUSE  Software Solutions Germany GmbH
HRB 36809, AG N=FCrnberg GF: Felix
Imend=F6rffer



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

