Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 4C73D2259C6
	for <lists+dm-devel@lfdr.de>; Mon, 20 Jul 2020 10:13:50 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-mUE5Bu8IM9qEaB2nptzHAQ-1; Mon, 20 Jul 2020 04:13:46 -0400
X-MC-Unique: mUE5Bu8IM9qEaB2nptzHAQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5DA78100A8EA;
	Mon, 20 Jul 2020 08:13:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC78A60E3E;
	Mon, 20 Jul 2020 08:13:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C92561809554;
	Mon, 20 Jul 2020 08:13:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06K8DX9B012870 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Jul 2020 04:13:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1FBFEC54B4; Mon, 20 Jul 2020 08:13:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 19CEEC613F
	for <dm-devel@redhat.com>; Mon, 20 Jul 2020 08:13:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 088D4185A797
	for <dm-devel@redhat.com>; Mon, 20 Jul 2020 08:13:31 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-295-N4D40Vy-MhS4Nlz3O92ibg-1; Mon, 20 Jul 2020 04:13:28 -0400
X-MC-Unique: N4D40Vy-MhS4Nlz3O92ibg-1
IronPort-SDR: mbD0LHmvs3e9DYdeaCisNne+U2VKE1sXx0DnRQXK1QxeYjAQBJ1tX+WcoaxwTztGnbnAhjjN8q
	D5TAn/rAfyrqVpVgp9P81EYoJs1Y6WiP2U0j6DoVDIHARi0p6+T91QvHp2BbBw6fdPUshQiHqr
	NBOF9xmI6G4dBu21MNFVQXyXlO/N/khvwEON3Qb7YPgnUvJIbiziC9chomMpSpsNb/e0VoDV12
	D/+v28pe8iwPKYbRPvk4NyHEfrvUzxreCXwMwshb7VDA2NEDB0rg6lCO8rnHMpCTWBAcd8AWq6
	7i8=
X-IronPort-AV: E=Sophos;i="5.75,374,1589212800"; d="scan'208";a="245934841"
Received: from mail-bl2nam02lp2054.outbound.protection.outlook.com (HELO
	NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.54])
	by ob1.hgst.iphmx.com with ESMTP; 20 Jul 2020 16:13:48 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY1PR04MB2220.namprd04.prod.outlook.com (2a01:111:e400:c60e::22)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.23;
	Mon, 20 Jul 2020 08:13:25 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::d9e5:135e:cfd9:4de0]) by
	CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::d9e5:135e:cfd9:4de0%7]) with mapi id 15.20.3195.025;
	Mon, 20 Jul 2020 08:13:25 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Christoph Hellwig <hch@lst.de>, "axboe@kernel.dk" <axboe@kernel.dk>
Thread-Topic: a fix and two cleanups around blk_stack_limits
Thread-Index: AQHWXlzSo6SIEk/VxUe714FCmwMHuQ==
Date: Mon, 20 Jul 2020 08:13:25 +0000
Message-ID: <CY4PR04MB3751242EF7AE2172A719F201E77B0@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200720061251.652457-1-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4023288c-0cfe-47a3-828a-08d82c84c6e3
x-ms-traffictypediagnostic: CY1PR04MB2220:
x-microsoft-antispam-prvs: <CY1PR04MB22200F1BBCF50B9BBD4258EDE77B0@CY1PR04MB2220.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PGVSv1pcDhicHPCFelzhY2O9cC3rLmsUFaVe3yL8PDMtAu8FfJ3V2dSNCrx4KEPfdpZGv/d3Iso5RDd1ToXz+5I4eoXs1mCtnXR3hzeSyAHFPxqBpFPrW0wxKM0dCSq3Py0rqR/r68EjxG53wscaYt1I56xLXLbTIdU/Q8IMZKQf1jtsmxbHd5aM4J6rEoayniG/D82FbWSQzct54d6dsAiOdQY1/iahUSdoSqp1g5yJI14be2gPePj/yjFbZznA+1s7c351kTZGhtxtAgRv6q1yH9VmK5kH6Chi7qk4svm6iCQ9PA34Crhi2xJN4n0p
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(376002)(136003)(346002)(366004)(396003)(39860400002)(6506007)(53546011)(186003)(2906002)(316002)(55016002)(66476007)(478600001)(8936002)(9686003)(4326008)(26005)(91956017)(54906003)(76116006)(86362001)(5660300002)(33656002)(110136005)(52536014)(66446008)(64756008)(66556008)(66946007)(4744005)(7696005)(71200400001)(8676002)(83380400001);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: D2nwjhA4GRlR6LIiZqOQcaV8KisqqjVJPiL+G3Dzvi1sjrynV6+IsXvDkgBSMuR0omLVYWsM32GCKCthS6E+9zBTiE1PMNHNQsSFI3f+qQ43sjeI/d1XHR3r5nGrwZ19Y1I8kPsSvV51/ZePp61i20oxWD52jX2+vJ/D4ghsyBbMuczBjnkVpc7zsRcg9V8IY8DidGFAJk3W32WjniqK5vDOY9wpR6CT7d8T2GomO21vdDcxiHOmImFDSb31WRuI6RHmkA1i87P7HVBfa+Cyla18OvvjfevBhy2+2ICxjiefdijx3+eBmqD8DXD+Gmd3rQxWEyYJlzF8Q5oP1rhG5mIuDDk+z++dejI8iAmBZlsafZo0o4U1mu0qXCmyaYwabB9/OhSMAhlt5BSIivs/BIqCqsHjQIANjwl8L2OXA1+sUUJPrXGpUKdO1cx6RMQyVvVaK4u6E4ijPQmLG1M5eYffts2xA2751PvhPYsbvCQKTcpuP5XXWV4ifO69d3GQ
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4023288c-0cfe-47a3-828a-08d82c84c6e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2020 08:13:25.6319 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kMDc+0yXC417TPpfT/J8n5RNHwOocazEESzip8O/VUPaCqEi3wqmCtYd2Y3Xa1kRH6nOBGNimWFQiAkosUPRhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR04MB2220
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06K8DX9B012870
X-loop: dm-devel@redhat.com
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] a fix and two cleanups around blk_stack_limits
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/07/20 15:13, Christoph Hellwig wrote:
> Hi Jens,
> 
> this series ensures that the zoned device limitations are properly
> inherited in blk_stack_limits, and then cleanups up two rather
> pointless wrappers around it.
> 

Tested with dm-linear, dm-crypt and dm-zoned multi device setup (from dm-5.9
tree). No problems detected.

Tested-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

