Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id A2D3C20D0EE
	for <lists+dm-devel@lfdr.de>; Mon, 29 Jun 2020 20:39:48 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-837PpjSSMf2JlujDaP998g-1; Mon, 29 Jun 2020 14:39:45 -0400
X-MC-Unique: 837PpjSSMf2JlujDaP998g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B45598015F6;
	Mon, 29 Jun 2020 18:39:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 93F6D7418F;
	Mon, 29 Jun 2020 18:39:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 555568789D;
	Mon, 29 Jun 2020 18:39:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05TA8doX019932 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jun 2020 06:08:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 55F032029F77; Mon, 29 Jun 2020 10:08:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 50F1F2026D5D
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 10:08:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B88B80013F
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 10:08:36 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-481-TCTrc8ljO1CzoIH9Vw1oOg-1; Mon, 29 Jun 2020 06:08:33 -0400
X-MC-Unique: TCTrc8ljO1CzoIH9Vw1oOg-1
IronPort-SDR: 0UGPOV2dK3CbSP6xn/1y6/akdyB8d2z+Kw4QG3rmQfnDvOCL4fgGIN01EfdG73nck/neYVS2FD
	dK/IWub0HkrtXq8XngpP2zZie+SUnbhphCzUPWCdsjdByHlYdXP7Mz4whUIr9510xBD0J25oRq
	qmNx71zrv78vl/4O7lIelK82F8DWhy7LrmPMrg63dbagR3/+d6X8yzLEw3+Qff8jeRNdUlkZ+H
	1Xj66Qh2Lm8qb5VjCjMWth6Mf2PI17EFo/x1l2QwCOpO+x5Y7UdnteIt34hOmztdgs9fT+kiVr
	iDo=
X-IronPort-AV: E=Sophos;i="5.75,294,1589212800"; d="scan'208";a="145495340"
Received: from mail-dm6nam11lp2177.outbound.protection.outlook.com (HELO
	NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.177])
	by ob1.hgst.iphmx.com with ESMTP; 29 Jun 2020 18:08:30 +0800
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	(2603:10b6:803:47::21) by SN4PR0401MB3600.namprd04.prod.outlook.com
	(2603:10b6:803:46::31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20;
	Mon, 29 Jun 2020 10:08:28 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::1447:186c:326e:30b2]) by
	SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::1447:186c:326e:30b2%7]) with mapi id 15.20.3131.026;
	Mon, 29 Jun 2020 10:08:28 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, Tejun Heo
	<tj@kernel.org>
Thread-Topic: [PATCH 05/14] block: move bio_associate_blkg_from_page to
	mm/page_io.c
Thread-Index: AQHWTFVJvbniMUYqRE62LRQB5ELYuA==
Date: Mon, 29 Jun 2020 10:08:28 +0000
Message-ID: <SN4PR0401MB3598A350166C7B419FA8853F9B6E0@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20200627073159.2447325-1-hch@lst.de>
	<20200627073159.2447325-6-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2001:a62:1515:bd01:5d2:80d1:159b:260e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: cc4d6c6b-c75e-471d-f869-08d81c145e90
x-ms-traffictypediagnostic: SN4PR0401MB3600:
x-microsoft-antispam-prvs: <SN4PR0401MB360012D1892D43F1FB1FE8DA9B6E0@SN4PR0401MB3600.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-forefront-prvs: 044968D9E1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tLykQdwmCmQ+hRPvhHzV7ITBWV08ZjvCIvOfJZrm44aoMv1o97XZXQluqlClsWotI5DJDd8b2TTFHSQr6KyBCkDoIxS+9v1behyw5m52bRxcLy6d5Oxctgk1jyOfJRtVttVpPoe6X2huJzNMkZyfsizy7Hv6+bxFkA3WhPnwoGrjN9QsQtypdZ/5SH+Z1KnisOvSBB4w5yjucVZataOKAE91X+Mu5Z1+aa3CdQJVU7R/a1a/gjOfi8YDCF0iPRw624qJQUDoKEjB/lwbgxETY65fvfqJbzJOSurtp3yVqLaqWLxE4FYlvI7nNswqVSRq
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(39860400002)(136003)(366004)(396003)(346002)(376002)(55016002)(54906003)(110136005)(316002)(558084003)(4326008)(7696005)(9686003)(53546011)(6506007)(186003)(71200400001)(66556008)(66476007)(64756008)(7416002)(2906002)(5660300002)(52536014)(76116006)(8676002)(8936002)(66446008)(66946007)(478600001)(91956017)(33656002)(86362001);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: kFztssL6AgodECkMisBYuW5IwRli1aZAKYwXmYD38tUu9C5pyRR1bPeTgkZwezqQqrZIdKXS/gY0KyjixIKowdbCiz75AbX9JFPdMCJnZ9uxqMtliojEez0tBaBWuTVX7ypvpc69Uk0KLoJCa/qODQ7PcDLZBKgag+MTDG1NnEYlMLmaWN7ZpHMdmDZkrDDSSQZuzyLW90r5dO8J9+ktuwKdyJ3ajJrrPoXOu1QK0jsjOowrYtHlRlYw47csJj2sJ6TG8ZBIh04YFc4uqyTgLjmc75oAmqy92VxIsIOXRhZdbck2JR121tbVXk6Cb+Ht8nQHXOhlLINJ9ng+nOAiDRb2oLmjDBvEOSMtpsBjkmvn18/NpRnDnimMFMT1PVDBeH6cIWrWxKSfRXDcp2yb+O4Z4Jw6q69PnmiyDkq1S9KYFyJlbXjyb9ObCwcB+lmXSDWCWGsFY9/8fg9EM5/Ya3tjFmzxDAi/qQyAkrP0vaYUo4XvkDjPX2jq0V4DLrThGW42bA6xdVNnyaVMu53VvUkrX4b7G059vIFqqJBugu1moI2CGlC2mWGO859iDezg
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3598.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc4d6c6b-c75e-471d-f869-08d81c145e90
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2020 10:08:28.2858 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VAqoNFuK7vz70iEfCoIGcF1+Ha6HDxfv/ZdiQGnWHVgV8qnKFkqCZnTfmRh9+91xs/TKfX2iU0t4fnqNH9+ZLIkb+i5Y6cyaIJXy89xuzHE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0401MB3600
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05TA8doX019932
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 29 Jun 2020 14:39:14 -0400
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Johannes, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Li Zefan <lizefan@huawei.com>, Weiner <hannes@cmpxchg.org>,
	Dennis Zhou <dennis@kernel.org>
Subject: Re: [dm-devel] [PATCH 05/14] block: move
 bio_associate_blkg_from_page to mm/page_io.c
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

On 27/06/2020 09:33, Christoph Hellwig wrote:
> bio_associate_blkg_from_page is a special purpose helper for swap bios

'for swapping' or 'to swap' I think.

Otherwise,
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

