Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 77CED20D0EB
	for <lists+dm-devel@lfdr.de>; Mon, 29 Jun 2020 20:39:43 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-knBpq_bjO16glgcu29Zugw-1; Mon, 29 Jun 2020 14:39:40 -0400
X-MC-Unique: knBpq_bjO16glgcu29Zugw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 912C0193F561;
	Mon, 29 Jun 2020 18:39:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E5D15C3FD;
	Mon, 29 Jun 2020 18:39:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B046D8789D;
	Mon, 29 Jun 2020 18:39:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05T9Zmet017467 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jun 2020 05:35:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4816A10EE6D5; Mon, 29 Jun 2020 09:35:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4249510EE6D3
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 09:35:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C13E101A525
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 09:35:46 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-395-Mug9iDK0OrW-L4Obvj9j1Q-1; Mon, 29 Jun 2020 05:35:43 -0400
X-MC-Unique: Mug9iDK0OrW-L4Obvj9j1Q-1
IronPort-SDR: Y7XBPpzYqRBmjA2WuilWFhefGY//XoUNsVX7FCqQEs99gdk5eEYDjBz3kLAqvb+V2AhSIE+w0u
	VtwdGn7OewaY7Ufsv7SmX0C8rvjYJFVphToFBvZUx0oEyJRJAIVuNwz4Xm+XZhQEKA/Q44XN9K
	M/hVxa6Iy6o4D7yVJtbCLDAlDCPfAIbkTiHXH4jjL545h2xa6E8eK1fZTGaVJQ0GCJJbFj0tMu
	JJAdb3qQ1mCwpDTTY61u5VkZUwXa7qC/Wd2ON34cZA2nNfdPL6Hz2gIY2KG9tn6K0ZZBTYQ9YS
	gD4=
X-IronPort-AV: E=Sophos;i="5.75,294,1589212800"; d="scan'208";a="244189572"
Received: from mail-dm6nam12lp2177.outbound.protection.outlook.com (HELO
	NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.177])
	by ob1.hgst.iphmx.com with ESMTP; 29 Jun 2020 17:33:49 +0800
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	(2603:10b6:803:47::21) by SN6PR04MB4461.namprd04.prod.outlook.com
	(2603:10b6:805:ac::15) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20;
	Mon, 29 Jun 2020 09:33:37 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::1447:186c:326e:30b2]) by
	SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::1447:186c:326e:30b2%7]) with mapi id 15.20.3131.026;
	Mon, 29 Jun 2020 09:33:37 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, Tejun Heo
	<tj@kernel.org>
Thread-Topic: [PATCH 02/14] block: remove bio_disassociate_blkg
Thread-Index: AQHWTFVNaIwLRIH5Bka8FkGqn1pzlA==
Date: Mon, 29 Jun 2020 09:33:37 +0000
Message-ID: <SN4PR0401MB359848B55D6E3BE7ECE717B99B6E0@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20200627073159.2447325-1-hch@lst.de>
	<20200627073159.2447325-3-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2001:a62:1515:bd01:5d2:80d1:159b:260e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 61009f67-2e6b-4c0f-29ee-08d81c0f8022
x-ms-traffictypediagnostic: SN6PR04MB4461:
x-microsoft-antispam-prvs: <SN6PR04MB44613963613469B46E20D5859B6E0@SN6PR04MB4461.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 044968D9E1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q28bZ07EpmhnVTmqajiSWKV2ZPJCBU5sys/g5xcvbKHSuLrTJVGyGuNIFWRCmQD/coPZBpfM0p7nSgOPaIr0GpCqdovcj0gvomRKXHGq01EbK/mWCCm2oURXXVk0YuSfxJVJg3mlKxUWjF1ztc3ZVKff7r7uzHJNlYg4/2JWTdvEag0DItoD5X95htTu0vOJQ2OxQkJoQazeULvT8nvnLe4fJC/5iEKWOfSF+pViphPs6FSDuJ1L6uzw6nStZzovXbDeIlpHWq94TZPeCsWVxRwplJTfzZ1HTO2U12v81or3RBbnfwppbIGReeXDbT5p
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(39860400002)(366004)(376002)(136003)(396003)(346002)(316002)(9686003)(7416002)(4326008)(33656002)(5660300002)(54906003)(110136005)(53546011)(52536014)(71200400001)(8676002)(7696005)(478600001)(55016002)(6506007)(186003)(76116006)(66946007)(558084003)(2906002)(64756008)(66446008)(86362001)(91956017)(66556008)(8936002)(66476007);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: jkRI+nSY0ywkRiEmQHGKO+qoboZtdUYeqT4RX+K07a2sg2VAHa9Bq0P34qjQ19a+xusPMCKLkh/bg66Qg8zh7JM8y4xGTw6u5NcgojBBbRrqMgC+Y7g+AaL7LsuT4ucm35lg77cxAV4+rJZvagLjr4H2zGV9cezU1DgULfu7LV+lb2mPLO5FWa06lHuZkwd3saZkCy71Lm8hGqUztiV2wBPF6BG0juHEYPiwGVGQLLS+SoNftt28DMIRtc42DRBRl2uUQdDXihL7kA1X2XagUlmcCo8Efa0S8vGWGT6OUZL8wuhyvgnMMAjZBiGPB9wKEy1Lf8tNplgaKVPqUETwPbQVfqEIk8qnHTuDBKaUV0Pn070bBN5kAUDX5sn3tgtDkEns79RckQRGtMDoSLpH9l7tle7u0rK7g4czNQi5yxSMOqijvOw2sibbg71e4aj6k5/dP6hQ3G3iWODt1m5LvM3jmvI8KycORZNqrivl2LoWOnGKL4qYLcGH0H9TagA8dFLeVXfNr9bv/k4hCdqWXc+nZdeOI/xnecgAFniQOOc=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3598.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61009f67-2e6b-4c0f-29ee-08d81c0f8022
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2020 09:33:37.1945 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uidjJ+d+6CG7WoHL246qLqZmvVBYx/676I6F4ZXGDDNa6wsSx5IW5zr682ewwfuiWwpUTGvgnyu+d30uFvB9e5r1H0mGaMJpy6AxR8CxmGo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4461
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05T9Zmet017467
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 29 Jun 2020 14:39:14 -0400
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Johannes, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Li Zefan <lizefan@huawei.com>, Weiner <hannes@cmpxchg.org>,
	Dennis Zhou <dennis@kernel.org>
Subject: Re: [dm-devel] [PATCH 02/14] block: remove bio_disassociate_blkg
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 27/06/2020 09:33, Christoph Hellwig wrote:
> a new value to >bi_blkg.  Just open code the function in the two callers.
Nit: ->bi_blkg

Otherwise,
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

