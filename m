Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 935F02114AB
	for <lists+dm-devel@lfdr.de>; Wed,  1 Jul 2020 23:01:52 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-dvg5dwKWOWKQS9cLWOTM_w-1; Wed, 01 Jul 2020 17:01:48 -0400
X-MC-Unique: dvg5dwKWOWKQS9cLWOTM_w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3604080058A;
	Wed,  1 Jul 2020 21:01:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E0E12B4B6;
	Wed,  1 Jul 2020 21:01:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B35A91809543;
	Wed,  1 Jul 2020 21:01:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 061L1djb032069 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 Jul 2020 17:01:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D1DC3201B088; Wed,  1 Jul 2020 21:01:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC4CB2037D79
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 21:01:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 658DA8EF3A1
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 21:01:37 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [51.163.158.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-455-FRQiFyxZOs2e5qnsfQKpHQ-1;
	Wed, 01 Jul 2020 17:01:34 -0400
X-MC-Unique: FRQiFyxZOs2e5qnsfQKpHQ-1
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-21-lviHN0d3OOKdtyNObCQyOQ-1; Wed, 01 Jul 2020 23:01:32 +0200
X-MC-Unique: lviHN0d3OOKdtyNObCQyOQ-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB6PR0402MB2743.eurprd04.prod.outlook.com (2603:10a6:4:95::8) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21;
	Wed, 1 Jul 2020 21:01:31 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::8130:53b2:48d5:593]) by DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::8130:53b2:48d5:593%3]) with mapi id 15.20.3131.028;
	Wed, 1 Jul 2020 21:01:31 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH v2 7/7] multipath: add option to skip multipathd
	delegation
Thread-Index: AQHWSzEq6XHj1FXmT0a0nd+amL+W+ajzPzMA
Date: Wed, 1 Jul 2020 21:01:31 +0000
Message-ID: <dc236b19d85fcde7333a21bca0581f1601af7b86.camel@suse.com>
References: <1593117741-28750-1-git-send-email-bmarzins@redhat.com>
	<1593117741-28750-8-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1593117741-28750-8-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3
x-originating-ip: [94.218.227.113]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 91af815f-566e-4ec2-50d8-08d81e01ee3f
x-ms-traffictypediagnostic: DB6PR0402MB2743:
x-microsoft-antispam-prvs: <DB6PR0402MB274340714215EC0103020E8AFC6C0@DB6PR0402MB2743.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1923;
x-forefront-prvs: 04519BA941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZSjzXty1WGFOmFvyXWTk1tvdPnFYRnyUx8juX2aQ1cR1HCiV6sJOqtjmb1+VBG5cvGow0UiupNp1cXTgKWx7f7tdiELKn3hZChqbRFmDyskRTDOS+2vC8xUIflt/PVJdYpYiJ3U1a95UnbfVpdAGnl9hUt05iSYsPNQSd0yTchB34uPR2+6KdrZ+n98X8yxJQbmXk5aUwR8D3xD1YNc+s8rv+Dq/7DIASNmpczVrrqNxpMf+yuoQOWiQP7u6DP9QmkIw/ZdWhQCMCD503h5Sj++7nb90rJtzh6u9IZaeAKKZSi/+VfudCfiGx6WWD8Uj0gTE5Kt+pM1jw04BHneY7g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(396003)(136003)(39860400002)(366004)(376002)(346002)(6512007)(8676002)(36756003)(83380400001)(478600001)(6506007)(4744005)(26005)(66574015)(71200400001)(186003)(76116006)(91956017)(2616005)(66946007)(66446008)(64756008)(66556008)(66476007)(4326008)(2906002)(8936002)(5660300002)(316002)(110136005)(6486002)(86362001);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: TEtbWPv0RJb0iG3wz/AwPRiVv9LoqayRXaab/NScAZYwhOpbXTdsUeP1bGEy0k95RnZN7ybv91crCV25G1uwzfXPiYSG9I46RqEfpUnBeOoxcsL/2Rzv7+n2bZNNlViXtPE63sLiBrjED5Z4rebce/5v3uwcJCKFsjtkR7xkcWcYKVx+HQBhq2PVpXw0Rl1y8Gx4SdWxT+ig6XfMjP4OpjVjlO1E/J7629+wlg8/Es9QSHBw63BkBtFNRjKWLAc2pUnDTUsPKwovrrvI7ItdThOhXnoYahntUP+/HlazTkhAPlrM9en/9oyYwI4nUisHjGP93iVD97VG3/POOVsr0ghxqNvzgg0jiD65VA5py7wn7hZutOvhYaQmIEIKkTPZ2YMmyiGal/Cawwq4t1yxtErkjm0cY3UjZpfe33b1RRSGlYR0zfSASgiIGtLV2wTVS5t3plG2OMzgsWpRlQGm/WelD/OysVINS8peEui3SumHw2jVZzZIebcUQ7a1sihZ
x-ms-exchange-transport-forked: True
Content-ID: <3E371701E0764644813486E8D1ABEB5F@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91af815f-566e-4ec2-50d8-08d81e01ee3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2020 21:01:31.2323 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0iEnwlMmA6k7SGCcf6BijSkNbMBKV/NeOYd+bxV49/icodQb/LxDBjHhRu8p1AZvk0ITxhteU8eUX37Fj0IjWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2743
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 061L1djb032069
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH v2 7/7] multipath: add option to skip
 multipathd delegation
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-06-25 at 15:42 -0500, Benjamin Marzinski wrote:
> Add the -D option to allow users to skip delegating commands to
> multipathd.
>=20
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>

Reviewed-by: Martin Wilck <mwilck@suse.com>

> ---
>  libmultipath/config.h | 1 +
>  multipath/main.c      | 8 +++++++-
>  2 files changed, 8 insertions(+), 1 deletion(-)
--=20
Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
SUSE  Software Solutions Germany GmbH
HRB 36809, AG N=FCrnberg GF: Felix
Imend=F6rffer



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

