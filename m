Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 0863E231493
	for <lists+dm-devel@lfdr.de>; Tue, 28 Jul 2020 23:26:51 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-i-u6M_v9O72c0iZPkTHuCw-1; Tue, 28 Jul 2020 17:26:48 -0400
X-MC-Unique: i-u6M_v9O72c0iZPkTHuCw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 726491005504;
	Tue, 28 Jul 2020 21:26:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F008724D1;
	Tue, 28 Jul 2020 21:26:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EEB8DA35B0;
	Tue, 28 Jul 2020 21:26:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06SCsq6e001024 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 28 Jul 2020 08:54:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3D01C201828F; Tue, 28 Jul 2020 12:54:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 37510201828A
	for <dm-devel@redhat.com>; Tue, 28 Jul 2020 12:54:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A7561832D32
	for <dm-devel@redhat.com>; Tue, 28 Jul 2020 12:54:49 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-390-mrDcpBRDNWSwSedvlPYc-g-1; Tue, 28 Jul 2020 08:54:44 -0400
X-MC-Unique: mrDcpBRDNWSwSedvlPYc-g-1
IronPort-SDR: ZFjmBZNE+HTETK1BTJfuK9E5kELLB9K3qIMYsBmSaucJluK0rxKtkojYstYRoSkpXY8WiWG2la
	UvfEp5GNLboONN/wSoycnzeVcxZAR/ltMpaTLLPKCOrVnkIYZnIXWxIfSMas5iuiNNgYFLhDZA
	CwDx/fbvhBYYrzKqoSu/hhLb2BD3Wbo92HO0KFQ8Sbg5vnMFw47qj01umN0suxSQPnmKd0sd0Z
	arNbRsQp5TKIPPsGHsJXu5OdKVFUy3b7ZGoOnNsHDCDQBw12Hm+bi25DMM5xhrgNxfmSCW5oDy
	800=
X-IronPort-AV: E=Sophos;i="5.75,406,1589212800"; d="scan'208";a="252888668"
Received: from mail-dm6nam11lp2175.outbound.protection.outlook.com (HELO
	NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.175])
	by ob1.hgst.iphmx.com with ESMTP; 28 Jul 2020 20:54:42 +0800
Received: from DM5PR0401MB3591.namprd04.prod.outlook.com (2603:10b6:4:7e::15)
	by DM6PR04MB5322.namprd04.prod.outlook.com (2603:10b6:5:106::16) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.26;
	Tue, 28 Jul 2020 12:54:40 +0000
Received: from DM5PR0401MB3591.namprd04.prod.outlook.com
	([fe80::c862:9cd5:689a:8573]) by
	DM5PR0401MB3591.namprd04.prod.outlook.com
	([fe80::c862:9cd5:689a:8573%5]) with mapi id 15.20.3216.033;
	Tue, 28 Jul 2020 12:54:40 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Thread-Topic: [PATCH 12/14] bdi: replace BDI_CAP_STABLE_WRITES with a queue
	and a sb flag
Thread-Index: AQHWYYzciyAO2mhny0WEWIk3W3JOpQ==
Date: Tue, 28 Jul 2020 12:54:40 +0000
Message-ID: <DM5PR0401MB35918B36977C0B2EBB7F262F9B730@DM5PR0401MB3591.namprd04.prod.outlook.com>
References: <20200724073313.138789-1-hch@lst.de>
	<20200724073313.138789-13-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.240.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 31e0b3d0-c47a-48ca-363a-08d832f56489
x-ms-traffictypediagnostic: DM6PR04MB5322:
x-microsoft-antispam-prvs: <DM6PR04MB53220BC8FC684C251C6EBF5A9B730@DM6PR04MB5322.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T/yPeA8qh/rQgzQmjI8BQDmycI+yvDKNgThgiXWHNjjuusLVniiHii7Xs5llqxBhzac32Ut9f0viphdg31/ZsThTIyPqI5410dgXg03CTDavZ56Jb4tZ/soLeUBLtny8yY6GWx3630tBjArX6WgZH+9SOYv8vZZKWgNEMttX9pXEV1XFj1df7m6yFLJBLVAWYBbGjrY5v3iVtenDV0MR7r/L5Bo87zjS5MLbGJLN2jhgQkZKo1VeWXVkQ9UhJkWM9YiAN/iuhoRDeNDNE/shz2Yq3xZHNfYcF0TCV+47fUxZsNU2+XFquWXJoxb2hnWs32mbyGM2TgpG1XyMVZwpzQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DM5PR0401MB3591.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(396003)(346002)(136003)(376002)(366004)(39860400002)(5660300002)(8676002)(66556008)(66476007)(66946007)(66446008)(19618925003)(9686003)(7696005)(186003)(26005)(64756008)(86362001)(478600001)(55016002)(6506007)(8936002)(52536014)(7416002)(71200400001)(110136005)(558084003)(4270600006)(33656002)(4326008)(76116006)(91956017)(316002)(2906002)(54906003);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: 89maTvJPspOuacsDUS3LL+WKq2F7jyIjTk8KzJ2Po3vc17ENqkU1PZWitO7B5q9juIQetGeGZKXbM8bzrWPVhbbgWcjUHUOMknY6kXKP8GAbTbvVnsoY9eEp1N1W1OlIagv1h2hmqg4dghSfyuAlTOE7crGQ/Amikns3b2F3ob4sz2TN9Q/1VhtI/mo5mZv6qed+N0X0woUA9O3jRMoD8m3+EOD5x+6HhhRe2NfxczaPaf4lkVMgQ9n9ynt4h4yXiKVZEwuZtFol8C3hQEuPcYaE4O6DaoDwsUhF9OtW2pC9zUwA5Srerm/9ahGHmCz3xGCnMIj9gV4X5PJppHXN6Cd2w8bblTWF5YfLAwMHQ0nQEtFoOZnVXH4kFmbrYiCYxiGzlRlM8MQif1zxN8vg9wlaeYVVabFiGMIdoW1Lvdsvo+t5eysmJMIBtaSpZgMBtfy8/CqBQpGTFGh5zr2+ZJ/WDZprkP9gqOi3+E2Kr33BTDWPGVwrvXfIsFGqgNUL
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR0401MB3591.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31e0b3d0-c47a-48ca-363a-08d832f56489
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2020 12:54:40.7335 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QBI2uUsV/Gk1eL8gdBglcrLdbO2lk0xAj739ocxmoqy8Nk+RjXyhOxkQVQKoyZDOUS5VeCs6KZsHMf6P74GQXM7paCXcP6VgrWIwoAnDBoc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB5322
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06SCsq6e001024
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 28 Jul 2020 17:25:09 -0400
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
Subject: Re: [dm-devel] [PATCH 12/14] bdi: replace BDI_CAP_STABLE_WRITES
 with a queue and a sb flag
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

