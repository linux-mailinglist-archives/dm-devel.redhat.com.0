Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 44BE12114A3
	for <lists+dm-devel@lfdr.de>; Wed,  1 Jul 2020 23:00:07 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-wY_cdX6SPiahnLrP0JJtwQ-1; Wed, 01 Jul 2020 17:00:03 -0400
X-MC-Unique: wY_cdX6SPiahnLrP0JJtwQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7019B800D5C;
	Wed,  1 Jul 2020 20:59:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A769C78120;
	Wed,  1 Jul 2020 20:59:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B308E6C9C6;
	Wed,  1 Jul 2020 20:59:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 061Kxnwk031473 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 Jul 2020 16:59:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2FB0E2156A3B; Wed,  1 Jul 2020 20:59:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A9DA2144B34
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 20:59:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92CC4185A78B
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 20:59:46 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [62.140.7.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-504-SlWsv8nyOGeJ95rfGxU8CQ-1;
	Wed, 01 Jul 2020 16:59:44 -0400
X-MC-Unique: SlWsv8nyOGeJ95rfGxU8CQ-1
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-ve1eur01lp2058.outbound.protection.outlook.com [104.47.1.58])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-4-qgQK0_rXNW-Wyu-MvEhpBQ-1; Wed, 01 Jul 2020 22:59:41 +0200
X-MC-Unique: qgQK0_rXNW-Wyu-MvEhpBQ-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB6PR0402MB2743.eurprd04.prod.outlook.com (2603:10a6:4:95::8) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21;
	Wed, 1 Jul 2020 20:59:39 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::8130:53b2:48d5:593]) by DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::8130:53b2:48d5:593%3]) with mapi id 15.20.3131.028;
	Wed, 1 Jul 2020 20:59:39 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH v2 4/7] multipathd: add "del maps" multipathd command
Thread-Index: AQHWSzEq7SszXvn+aU6SfR+e8jTY+KjzPq4A
Date: Wed, 1 Jul 2020 20:59:39 +0000
Message-ID: <481607fbb24010da8a7b730b4531e1b688cebbd1.camel@suse.com>
References: <1593117741-28750-1-git-send-email-bmarzins@redhat.com>
	<1593117741-28750-5-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1593117741-28750-5-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3
x-originating-ip: [94.218.227.113]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cb53bfc2-79c4-40af-5582-08d81e01ab93
x-ms-traffictypediagnostic: DB6PR0402MB2743:
x-microsoft-antispam-prvs: <DB6PR0402MB2743D2C33312BFEE969AB072FC6C0@DB6PR0402MB2743.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:626;
x-forefront-prvs: 04519BA941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lav94q2L36LgqpzgrzGiFUmMb2T8tR53YQhKK4ygBEv8OsQ4AA0wc7wvgcoB2lY5mF6L/j8FIsWrRfevhKKv0AwwykRFQXMXi4IC0jKkLjRxAfReUhd5lFt0JSXhoKP2IIw+dd3qedson3zhvnt0ImX++V+pcRDb1OE5U6eNZkditvhwO/YcfkSrHkCGcHj+wNKHvGoSzkSmFw3TeFQ/fRYG4N9M/aUIlWm3AFPf3LTEUjwLtSUuguH89nEojD3wTxg6CMATiHHhbcw6+g4GrYbLoiUZxU42anJ1ov1XhY9I1615hjb6YeMr+gi/I5hldYe+pdlOXsYdIQ5y5IkIAA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(396003)(136003)(39860400002)(366004)(376002)(346002)(6512007)(8676002)(36756003)(478600001)(6506007)(26005)(71200400001)(186003)(76116006)(91956017)(2616005)(66946007)(66446008)(64756008)(66556008)(66476007)(4326008)(2906002)(8936002)(558084003)(5660300002)(316002)(110136005)(6486002)(86362001);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: e5T8C4ygQlOinM6iu2g2x/yy6Vz8QUOKKfyUUnk5IuA6905JWDO2l2E+Jvyrkk2+pH7NeTP+aoDkHFUAviVnVzsEZWb/abyqRujwQGrlWnie9r+79OlPwBTnKkW8iXqIe81wC9E0/uMvxzL3q2k9bQoKK3g4nhPjL1YuWJC2KfRXytQK0EKQ7fu65WJa77mcDZzaND3WNsWPq8wGbqqkhj0ZRsBSwzn4IYvH/dBFb50TG/Km88BS5C7IM3JG3HQzmJBBPmDUzfiv65EtZDF5xQ2I7Z4BDbVYk/V/oCBbt0VvDODJWpOermRsdjdoDq1oxnHfIu2S1Rru5GR6055YGaKsFqNcJOqG+IHzL+1bbOz1yZ06KVmU8VSFqscipC7iJmXk+8+CMb+hFlD0kCjP4UcsXNur4bhyuxrrplNy0GIFdDGbEnvVzVK8tuEhOR9plVIuZX97PCujl6GhmBApxZhSAf0q06ZTq4Uq50mlPAgDIz32Z+ZE2GHjSdZbhp+c
x-ms-exchange-transport-forked: True
Content-ID: <39F99159AEE2094594DEE5D06FDD28EB@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb53bfc2-79c4-40af-5582-08d81e01ab93
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2020 20:59:39.4046 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ELJdIug4dit2QxTKyHcz5U2S1B6xRuCH1GGCZeEsoNhPMNuJw1F5tn6dsVhLudA/LWJeJXrNID9NdVBuF9TTQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2743
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 061Kxnwk031473
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH v2 4/7] multipathd: add "del maps" multipathd
	command
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

On Thu, 2020-06-25 at 15:42 -0500, Benjamin Marzinski wrote:
> This will flush all multipath devices.
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

