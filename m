Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 066672292A5
	for <lists+dm-devel@lfdr.de>; Wed, 22 Jul 2020 09:56:28 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-a_RXMN3QOF6qMxoDV3V0YQ-1; Wed, 22 Jul 2020 03:56:25 -0400
X-MC-Unique: a_RXMN3QOF6qMxoDV3V0YQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 918F08005B0;
	Wed, 22 Jul 2020 07:56:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FA82726B9;
	Wed, 22 Jul 2020 07:56:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C4ED11809554;
	Wed, 22 Jul 2020 07:55:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06M73W6I013624 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 22 Jul 2020 03:03:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 368362026D67; Wed, 22 Jul 2020 07:03:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D05D20A053B
	for <dm-devel@redhat.com>; Wed, 22 Jul 2020 07:03:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14B80101244A
	for <dm-devel@redhat.com>; Wed, 22 Jul 2020 07:03:30 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-500-bLHWL7AIOAuKYURftKR9aQ-1; Wed, 22 Jul 2020 03:03:27 -0400
X-MC-Unique: bLHWL7AIOAuKYURftKR9aQ-1
IronPort-SDR: M11R3nnCHYvP6eLcDVDQ7lvFZuWGlt7OxOcsv8q+8ZkPvcEL6hUQJU1I+aN3i2RfgfWpZGQFqC
	4eYoAApKszoFbzO3wQoqpfN/0O78U1AzVyvYRn9xUNKpLoaB2QivOEc49KN3DXKGgDJcUTS44v
	ytxNLH5NkqXRsd4Ro6VfP6Q8ddeTk11Wyn/IXwYA4ypK9v0Tlfa5WFnVqIc/c0SEQKTfOXzCve
	ivd/NtSWCV+6Fzem4XKhDo9XTt2iDhHoBEw+ZfbEL8z9zlfdjEFFm3lyLHqk71hMAaNBemz2dX
	XwU=
X-IronPort-AV: E=Sophos;i="5.75,381,1589212800"; d="scan'208";a="246134845"
Received: from mail-mw2nam10lp2109.outbound.protection.outlook.com (HELO
	NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.109])
	by ob1.hgst.iphmx.com with ESMTP; 22 Jul 2020 15:03:27 +0800
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	(2603:10b6:803:47::21) by SN2PR04MB2239.namprd04.prod.outlook.com
	(2603:10b6:804:15::27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22;
	Wed, 22 Jul 2020 07:03:21 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::1447:186c:326e:30b2]) by
	SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::1447:186c:326e:30b2%7]) with mapi id 15.20.3195.026;
	Wed, 22 Jul 2020 07:03:21 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Thread-Topic: [PATCH 02/14] drbd: remove dead code in device_to_statistics
Thread-Index: AQHWX/FEcddsN2HZWUefz5cntVZ8LA==
Date: Wed, 22 Jul 2020 07:03:21 +0000
Message-ID: <SN4PR0401MB3598495DA5AF46CAF019BDC69B790@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20200722062552.212200-1-hch@lst.de>
	<20200722062552.212200-3-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.240.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f03f427f-96e1-4bfc-9150-08d82e0d51eb
x-ms-traffictypediagnostic: SN2PR04MB2239:
x-microsoft-antispam-prvs: <SN2PR04MB2239054EBC0DF37D3B353C339B790@SN2PR04MB2239.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ur+KZmKpBcIPSPWe6QDshqRorQKKgiz4i4dCc2w/Mgbz7W2X8PzWs1JO/Ez/ayfUEGw7CHVyXvb51qPcJ/kYmyK6xIPgf2SVdVkkEstU8iam13w0F19SCf+eRj8nVQ7ykmFe7EozElGPGGESfemi2PLGcEgC0mVW4fTDIhGyMZgyGwP4zS1wKMeg3C57CvkDQFN7jyuHN+vgk3urX8A/Wi8gCKLZQZrgjx14F3Zx1SW48pdzZRYPdlQGi9tBKYXg5C8HGeWUW9xIE3kfLD9WBGjMYnHQrmpbQ8aVDTfpr2TSjasQN8B5kkmY1HTqdVzR
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(52536014)(4326008)(478600001)(9686003)(7416002)(55016002)(5660300002)(83380400001)(33656002)(558084003)(8676002)(8936002)(76116006)(66476007)(64756008)(66446008)(66556008)(66946007)(26005)(54906003)(86362001)(6506007)(53546011)(316002)(2906002)(71200400001)(110136005)(91956017)(7696005)(186003);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: KbceinDNyzPx6xtboINYdGToiwTAz1b1sqcy4JMns4vDK+CdiytP5ixaX99sg79HGXhTLQN3MRmxAwmHKIEG38IzyJGlFE8ozXaaL1e/+m0CGSTRzMP8kMAtzmhmMVJKgysTJbuOKs/MeLW8PsA3hEQ+IEE7fVp/RLmjBbyUk0CCYT8Xqfwoerkk3t/Zv+Ihqxe/EOSksfJnc18Bo3nq4COV2/J4z1nf96a8H9OJulfoicgWRWF9wAQ8u7c1qV4qTgcYRNOW4NpwdG0errMx/hEziY6zvUYvbNdMl6J0zw5/FH5HTLIiajqWMa33TvanO0rqZP5WYz1GE2mJmvA0L9Atb71q48ThckFf1X+YiTdWkUHaXhBEDPbByN2TTEd5o/HTdEWbUmGwnUWQ9ZoSYbuFckiZEPmEPMgfsAIXg3WwNYyQqUuTL155JwDDs3jxbQPmU5eqmHnqvSVjUejd7JnbKGgslKZGcM4upqYN/jjEKVBuuWS7oAnYQCIuw4MI
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3598.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f03f427f-96e1-4bfc-9150-08d82e0d51eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2020 07:03:21.5601 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n/WE4dczctIGgSYMUR9eZ1R2NyNqbmbwZ/KCyUEJyhcSUO1QWSOT8jiIfxsQMNl1m8YItrC0n0JPgZFdEJWubhU05Q4/a2Blj9MUKK38nfM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR04MB2239
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06M73W6I013624
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 22 Jul 2020 03:31:58 -0400
Cc: "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
	Hans de Goede <hdegoede@redhat.com>, Richard,
	Minchan Kim <minchan@kernel.org>, Weinberger <richard@nod.at>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Song Liu <song@kernel.org>, "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
	"drbd-dev@lists.linbit.com" <drbd-dev@tron.linbit.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: Re: [dm-devel] [PATCH 02/14] drbd: remove dead code in
	device_to_statistics
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 22/07/2020 08:28, Christoph Hellwig wrote:
> Ever since the switch to blk-mq, a lower device not use by VM
                                           in-use/used? ~^

Also this looks like the last user of 'dev_lower_blocked' so it could
be removed from device_statistics if it's not an ABI (not sure with this
netlink stuff).



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

