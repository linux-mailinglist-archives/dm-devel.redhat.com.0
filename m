Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6508020D0EC
	for <lists+dm-devel@lfdr.de>; Mon, 29 Jun 2020 20:39:47 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-a18lvqIINZ-LUk_rF5Joqg-1; Mon, 29 Jun 2020 14:39:41 -0400
X-MC-Unique: a18lvqIINZ-LUk_rF5Joqg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3D27108BD0B;
	Mon, 29 Jun 2020 18:39:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B0A175C241;
	Mon, 29 Jun 2020 18:39:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 69BC61809554;
	Mon, 29 Jun 2020 18:39:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05T9blFA017631 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jun 2020 05:37:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E294E2157F24; Mon, 29 Jun 2020 09:37:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD3822157F23
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 09:37:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1ADA1859163
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 09:37:44 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-217-4f4OBtOCMA6J5dTY-nii1g-1; Mon, 29 Jun 2020 05:37:42 -0400
X-MC-Unique: 4f4OBtOCMA6J5dTY-nii1g-1
IronPort-SDR: G8lWVl2/Ho9vbr9IXJXWKGA0DIlQ7Xz2blxBbnscRHQvChGIVMwIgsR61CUY0P/8TDjrXOJLzl
	IocxJ+j4jkCqdwzBICFLmKez+vf9hTFzgAhTbAVXeQ/U0OtciHlmC2OmCEwgaoZ87UE2ej8EdZ
	ERk2yCHc+1zGBwrCDAe/3WHX4N0TSWVm21F/5Dv8AioL23nxSI8QtoZZ0+FEb7aiBxW9WMkDdt
	0628X4s0hKbNPIZ3xdIbSjaySuLU5BMww2bPKxUbtusKPGHf6wgmDA9tgux8GIeEOGCH3Z5gXE
	b04=
X-IronPort-AV: E=Sophos;i="5.75,294,1589212800"; d="scan'208";a="141168408"
Received: from mail-co1nam04lp2058.outbound.protection.outlook.com (HELO
	NAM04-CO1-obe.outbound.protection.outlook.com) ([104.47.45.58])
	by ob1.hgst.iphmx.com with ESMTP; 29 Jun 2020 17:37:38 +0800
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	(2603:10b6:803:47::21) by SN2PR04MB2317.namprd04.prod.outlook.com
	(2603:10b6:804:6::20) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21;
	Mon, 29 Jun 2020 09:37:36 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::1447:186c:326e:30b2]) by
	SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::1447:186c:326e:30b2%7]) with mapi id 15.20.3131.026;
	Mon, 29 Jun 2020 09:37:36 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, Tejun Heo
	<tj@kernel.org>
Thread-Topic: [PATCH 03/14] block: really clone the block cgroup in
	bio_clone_blkg_association
Thread-Index: AQHWTFVJmZY//kRbkEWoTGTQSwlZAw==
Date: Mon, 29 Jun 2020 09:37:36 +0000
Message-ID: <SN4PR0401MB35984B689047ADE7AC38BF139B6E0@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20200627073159.2447325-1-hch@lst.de>
	<20200627073159.2447325-4-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2001:a62:1515:bd01:5d2:80d1:159b:260e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 26b06046-a41c-453a-73ca-08d81c100eb1
x-ms-traffictypediagnostic: SN2PR04MB2317:
x-microsoft-antispam-prvs: <SN2PR04MB2317A868B92AABB02701CEED9B6E0@SN2PR04MB2317.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 044968D9E1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Wefofk7NDPopjnjiK5bWNCmGlNtT63iYCXEo0+yzOUCO1tXSXgn1eHXMyALsgN6t4SN6YKsAmikUe1iP8TFR7Wpk96YwhfgZZEz6jFBet2WhR9nq88o9dhcvj7RrDfVLBvoO7eqoxEoYxfB/Oxb99iLLzaHoB3O5ezy9DEpN3iYKScjEWKWxOX+3pSOI5/cUH3ooAuFUSaMK6FftI/VkOOBJIY7H3KEEbORwRLA/10Qg+1Z2WCtuKeVShRYAlGiC936T87nDVHdF+MSWrINepwDmDWvddXTUmJZmbKQbS8FzTlrxqN9HBnpSrIVF/pguF1xiomNJXjyyamlU8WLigQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(366004)(396003)(346002)(39860400002)(376002)(136003)(66946007)(71200400001)(9686003)(76116006)(91956017)(478600001)(5660300002)(66446008)(64756008)(66556008)(6506007)(66476007)(7416002)(52536014)(19618925003)(55016002)(186003)(4270600006)(7696005)(4326008)(8936002)(33656002)(316002)(54906003)(8676002)(2906002)(86362001)(558084003)(110136005);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: tOHSXkOEQk7uLjXirIRdVqVtq1qNVLgwC9vVts56XnfEMirayUufsYIzR4hKba49GjLjyhu5Lo6M8nMYQfj0wQ3a360kvYE1AMOQlSVFAK1glx8B+i+i6fOxBHh30T8M5XtxpeIEPsteYVZY9TvrhRpUsXbKjwCtVWsrOkcQuIJVIDiT1Ov0E7aSMPkOwjrxM/QVL5u/MxxoywqUKrM6FAMTJ8fbFQqCJwMxxYFAETq0ZSCl1p/ddAksPoCNJEMHiBKHK3cbD7L2vAwLWBIZlIbOsq1uPdct4NiWvjkV8OIKXt5SRrQuuKXGm2wVMY4HJUOL57QrDJ3R0M2exy+e9coJWQ0cRdZ/c5AbeZzoL7dAq9DqbQ2IkMPFfAL7ta0Tf4sDM8HjW5gNQ3W1SFOI8LD5q1ftj/cftKx/vqTlwJ9F7JSNprlchlzJr9DTdFEtbih6cScCE56Afx2ZGz0zEjysZOO8WQAiDw6QMC2ZPJe9Y+DKeSlV56Hvg8GcSTsOuhLekSgPlOCaLdBaa9/lAs5D8EljB2cD1SQObSKEIA0=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3598.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26b06046-a41c-453a-73ca-08d81c100eb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2020 09:37:36.3820 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LjG7swyiSFH5jhCPd2WWd9faFCg7GEo0RN6zrcbN5PRKpzg00he3aTTm9R5aUz41V/FJohT+e3WskNPJ9AjeXrhxS8y/F7Aw9TPXiQDXmIE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR04MB2317
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05T9blFA017631
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 29 Jun 2020 14:39:14 -0400
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Johannes, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Li Zefan <lizefan@huawei.com>, Weiner <hannes@cmpxchg.org>,
	Dennis Zhou <dennis@kernel.org>
Subject: Re: [dm-devel] [PATCH 03/14] block: really clone the block cgroup
 in bio_clone_blkg_association
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Looks good,
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

