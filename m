Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6A5BA20D0EA
	for <lists+dm-devel@lfdr.de>; Mon, 29 Jun 2020 20:39:43 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-8mI0zrXyMx-2V-6YonRqXw-1; Mon, 29 Jun 2020 14:39:40 -0400
X-MC-Unique: 8mI0zrXyMx-2V-6YonRqXw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F29971054F92;
	Mon, 29 Jun 2020 18:39:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D2FB29CFEF;
	Mon, 29 Jun 2020 18:39:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 911571809554;
	Mon, 29 Jun 2020 18:39:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05T8D3KX008311 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jun 2020 04:13:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B04022156A4F; Mon, 29 Jun 2020 08:13:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB24E2156A4A
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 08:12:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2C99100CF8A
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 08:12:59 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-320-LGra4fOBPmWKTZWuMl8N9Q-1; Mon, 29 Jun 2020 04:12:56 -0400
X-MC-Unique: LGra4fOBPmWKTZWuMl8N9Q-1
IronPort-SDR: yYoSB/bajzvprRL+QGL9WS5l1QePdYN+tE8/Vc3XmYSkLSKHQbR8UvWy1SOJNk8YulCFgtUz0e
	3dM/gxtf26S+e5NxR7Y9tlmKZVtV8oM3fDnoFOEGhQ/dsI2gmzC83MPncn5FVyeRXhxMZP0KFM
	J9HH3BX1gHHjAFZtxCU1KELeuSQLjP+qM9Sca5nCgCO9peGiunyOa8Hhg2nFs6msNOipatWUDA
	rqZ59z3LnJsLWUDmzx0EGKYVj3wGwd08hCzGI39ZRtKBE/bx3/3g3PiVJDYjYGYcP+X3Emk5Am
	sx4=
X-IronPort-AV: E=Sophos;i="5.75,294,1589212800"; d="scan'208";a="142522624"
Received: from mail-cys01nam02lp2051.outbound.protection.outlook.com (HELO
	NAM02-CY1-obe.outbound.protection.outlook.com) ([104.47.37.51])
	by ob1.hgst.iphmx.com with ESMTP; 29 Jun 2020 16:12:54 +0800
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com (10.167.139.149) by
	SN6PR04MB4240.namprd04.prod.outlook.com (52.135.77.147) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.3131.24; Mon, 29 Jun 2020 08:12:53 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::1447:186c:326e:30b2]) by
	SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::1447:186c:326e:30b2%7]) with mapi id 15.20.3131.026;
	Mon, 29 Jun 2020 08:12:53 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>
Thread-Topic: drive-by blk-cgroup cleanups
Thread-Index: AQHWTFVNUm1R45WD7UqFEU0lzIn8zQ==
Date: Mon, 29 Jun 2020 08:12:53 +0000
Message-ID: <SN4PR0401MB359875B144AC724CCFD539219B6E0@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20200627073159.2447325-1-hch@lst.de>
	<SN4PR0401MB3598A198ACA6126D96E949B59B6E0@SN4PR0401MB3598.namprd04.prod.outlook.com>
	<20200629080831.GA32117@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2001:a62:1515:bd01:5d2:80d1:159b:260e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0c1f63d6-b151-4989-edc9-08d81c04391c
x-ms-traffictypediagnostic: SN6PR04MB4240:
x-microsoft-antispam-prvs: <SN6PR04MB424069E6001243465B2857909B6E0@SN6PR04MB4240.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:873;
x-forefront-prvs: 044968D9E1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6BLWbCUWkYEfXy1divzZAy4AoFgLogOJDEYkU+j4KwS0ZQVv3EsR69b0MpPD7CoZehnNLf0IRcXhanRKvO4klLW1FsZpNhVgZUCVFE0snlWaMVNREBupOWZmgOMTqkHQhGKEUigjUaRWjnThZQ3+VOg2DcbBSfaTGDxEY2qJSn4PpTedOBn8dzNzqSA3tgwbpzRkg9uKDsLx/bCCklPGQ1gmzDHX5+irqEAFdljgHZW5g32qhOtkewM9yh1UVYPu2El+708riQ0mFJCejR/pgwUZbbkkOXG2iYpuD5aVOvc4B12UcbvbpKHYVHaaDrwq
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(346002)(376002)(136003)(396003)(366004)(39860400002)(86362001)(55016002)(9686003)(71200400001)(478600001)(53546011)(8936002)(8676002)(186003)(6506007)(7416002)(76116006)(91956017)(66556008)(66476007)(66446008)(64756008)(316002)(7696005)(54906003)(4744005)(6916009)(3480700007)(52536014)(66946007)(2906002)(4326008)(33656002)(5660300002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: 4IUkFNfsqgWS6Q5k81jfQ1xBbOIhstp6Rm/4LcjYMHBseMl2QGFjbPqhvKEGGUZ6uWuMXu1gi2/v4+vf3FPvZV87NTnx7XV76ul79WCZ6T4X5LOECWSqzxiVRX+JvXz4kyj9mw5m//z8Q1vRHWOqA9SMC+/m+d5dD4mxiC0jB24tXkCNXgjP3pKYOU1rjf6mNr5mg3p/5y2dMOqCK64AW4tTD5c3EV3plKyDNUyYiiivvQCOJUNmlEIHOD+C6JXRx2Iwqn/lRmRSruzXr5t8QOvsJFlIzdRmrNvQtQBKwzib87FFo/LnFVpiPKoseTfslmy8KCYg1bKPi+Wb79tid0jJlOfFLNyWDcByBjfBZyrwR3q1+5HZE81hkcFahYaFXbiVMGJsy46Z2BObvjPT6hX7sAN2kr81T3Nbnt6+izhj1l3xJwtIeCEUOoJ3YsiP0dgo0RnUjml4uWnLp8MWXGl+3Pdf1yF8jPeZqdmkn8ySI56C2UmkITG3Ni724yw4UID9pHp34QGKTi+yZLc1ZAMv+NwfqODsMI1L1xB85wU=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3598.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c1f63d6-b151-4989-edc9-08d81c04391c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2020 08:12:53.5599 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vJEfDprF4ERK5ytTKHmX9/boynSSfsD7jxfPgoCKSpKSrxEMbXu1Np6syIYpghSjxrAC0DhAHdB7pAGs7Hdxl/H7k1NXiUqI8L1D+hv0uD0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4240
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05T8D3KX008311
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 29 Jun 2020 14:39:14 -0400
Cc: Jens Axboe <axboe@kernel.dk>,
	"cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>, Li Zefan <lizefan@huawei.com>,
	Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
	Dennis Zhou <dennis@kernel.org>
Subject: Re: [dm-devel] drive-by blk-cgroup cleanups
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

On 29/06/2020 10:08, Christoph Hellwig wrote:
> You'll have to ask Jens :)  Note that your patch 2 overlaps with this
> series.  

Should have removed you from the To: field, sorry.

> I thik my version is a little nicer, given that
> blkcg_bio_issue_check is a very strange function doing multiple things
> as-is.
> 
> 

Agreed, I'll go through your series later today. Patches 1 and 3 are still 
applicable though I think. 



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

