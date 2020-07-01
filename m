Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id DD8C02114A4
	for <lists+dm-devel@lfdr.de>; Wed,  1 Jul 2020 23:00:58 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-jsW7HxEVMv-rM1ZBeJORbA-1; Wed, 01 Jul 2020 17:00:55 -0400
X-MC-Unique: jsW7HxEVMv-rM1ZBeJORbA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27BCFA0BD7;
	Wed,  1 Jul 2020 21:00:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0485D77888;
	Wed,  1 Jul 2020 21:00:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B31171809543;
	Wed,  1 Jul 2020 21:00:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 061L0f2p031888 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 Jul 2020 17:00:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0F4DE10E38EA; Wed,  1 Jul 2020 21:00:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 09F7710E38E2
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 21:00:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 367D6858F03
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 21:00:38 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [62.140.7.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-228-fC1Z3boDPjWTBtgrpTbN1g-1;
	Wed, 01 Jul 2020 17:00:35 -0400
X-MC-Unique: fC1Z3boDPjWTBtgrpTbN1g-1
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-ve1eur01lp2059.outbound.protection.outlook.com [104.47.1.59])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-2-Py0yB2DuPWGWXWMmIpLMJQ-1; Wed, 01 Jul 2020 23:00:32 +0200
X-MC-Unique: Py0yB2DuPWGWXWMmIpLMJQ-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB6PR0402MB2743.eurprd04.prod.outlook.com (2603:10a6:4:95::8) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21;
	Wed, 1 Jul 2020 21:00:31 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::8130:53b2:48d5:593]) by DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::8130:53b2:48d5:593%3]) with mapi id 15.20.3131.028;
	Wed, 1 Jul 2020 21:00:31 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH v2 6/7] multipath: delegate flushing maps to multipathd
Thread-Index: AQHWSzEqPB2+358sJkaI+E1FsYodu6jzPuwA
Date: Wed, 1 Jul 2020 21:00:31 +0000
Message-ID: <95db8fb3c557369a0532fff12bd93447f067fedb.camel@suse.com>
References: <1593117741-28750-1-git-send-email-bmarzins@redhat.com>
	<1593117741-28750-7-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1593117741-28750-7-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3
x-originating-ip: [94.218.227.113]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 12a4b72d-508c-4b96-ba38-08d81e01ca84
x-ms-traffictypediagnostic: DB6PR0402MB2743:
x-microsoft-antispam-prvs: <DB6PR0402MB274371E56D9AB3AB8FF16D0FFC6C0@DB6PR0402MB2743.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 04519BA941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qHDd2hQvNI9DzKGf/177LqwS1eS/zxjSvRfn6IbjZiy897WsR79m6feMlfZefFQAFEI8NQZF6sr+OcCcxql0YP6juXT7sHVNZEYi+EwOPKG3qOIiO0DGF99xIXKOrnWHfMr99F1HeO5hesswOKHvk0VF4QTvfXkyxYJv2Ig+v1yWHaIfIyxiSc1aQ2aKiLOyQRIQIqvogy79Q/wjMfjrS7/7LlZeH7jNWs8m8rrSCxJxSL+QV0GTuVzYxVQqEABQuRSbn9hLNXItAhpqblRdJNGEPjLqfsL02QHXn4dPvibCku2qAo7CmmSd8gORotzm
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(396003)(136003)(39860400002)(366004)(376002)(346002)(6512007)(8676002)(36756003)(83380400001)(478600001)(6506007)(4744005)(26005)(66574015)(71200400001)(186003)(76116006)(91956017)(2616005)(66946007)(66446008)(64756008)(66556008)(66476007)(4326008)(2906002)(8936002)(5660300002)(316002)(110136005)(6486002)(86362001);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: QJS9vsOJMIIRoY2BLKJg/nJFa2hOs/iemdGUu5Hib9x5hS5bEW0WN5z6fBl1jZqoJzJwnEvyj8QnhzWypc+FU6Id4+NI3OB+ImzpO2vfaCmY90M8ezUHCqmhrPsdaaEjryvF6F7ScN6aZlXfzJ+u6MHVa4puz9tcZEGqS//6BWAViNs7AuxADYIzXMqYPEnX9OSWaX5A9icqAyDxErxpdAaNE5gno5IbbcHFqdmVCkKIJ5eMkgJdU06Tsm1RcYgx6PBOtBqulDpkqFP7ptNiQJnEf1TXbAc5rmLV703DkwLThTO1iEMgzB4wmlbxihWaTfwDu2B0OdOzxerZhVB7A3AIvjjrAona/7DOWm0DpGOTsE0YAU4jgNf/4pZQaRjoE9hetiwA8PxtCBx0YUy9qOS85GjoAXj7oIirUDpQQwfduMx4QlqBGUopqzMF9a3AABOfnf2Dk1a4TIYUeSvX3HXuszguxUKX6svohyxTrf4u03cCCwarTzGzLAICFV6u
x-ms-exchange-transport-forked: True
Content-ID: <04CE8E80CF148F448D7A791A48E4F5D0@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12a4b72d-508c-4b96-ba38-08d81e01ca84
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2020 21:00:31.3212 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5q7xY2moxSopShDeiO/p+yaqYAgHmyWCNjXx4cAMDGrcWN2Xmz7kUMeeNbyDE4BXxJGSXa69/XAjW+rpX9VFQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2743
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 061L0f2p031888
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH v2 6/7] multipath: delegate flushing maps to
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-06-25 at 15:42 -0500, Benjamin Marzinski wrote:
> Since there can be problems with removing maps outside of multipathd,
> multipath should attempt to delegate this command to multipathd.
> However, multipathd doesn't attempt to suspend the device, in order
> to avoid potential hangs. If delegating to multipathd fails,
> multipath
> should try the remove itself.
>=20
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>

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

