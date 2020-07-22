Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id DB6392292A8
	for <lists+dm-devel@lfdr.de>; Wed, 22 Jul 2020 09:57:26 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-54ZrrbvVNBCc4yS-fv16DA-1; Wed, 22 Jul 2020 03:57:23 -0400
X-MC-Unique: 54ZrrbvVNBCc4yS-fv16DA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47061192FDA2;
	Wed, 22 Jul 2020 07:57:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 202228BEC5;
	Wed, 22 Jul 2020 07:57:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A975F730C3;
	Wed, 22 Jul 2020 07:56:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06M7EKDq014501 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 22 Jul 2020 03:14:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7560510145E1; Wed, 22 Jul 2020 07:14:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 700E3101458B
	for <dm-devel@redhat.com>; Wed, 22 Jul 2020 07:14:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB09C81D9C5
	for <dm-devel@redhat.com>; Wed, 22 Jul 2020 07:14:17 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-290-oGk2mfTKN0SxIlkzkrE_dg-1; Wed, 22 Jul 2020 03:14:15 -0400
X-MC-Unique: oGk2mfTKN0SxIlkzkrE_dg-1
IronPort-SDR: wHJ0sUf5fKcvjCD5KELUHIpZWn534zNWdK/RdtaRiz1HpW9fNPYLc4k8C4dqSOcfwS/VkCC3rx
	Sk/DCgaT2zjtuKphqdg/47ePdrawLXPmVN2QMtMo7E0n8aRVX39Q9GoXFOciL0NnbEnGthc+oL
	wKE8O+fmKJh/ArDe+3CyV970ETjHHfpr7HhppoSlYWcT+6B4L74A6J91BUPCZjsV+IQa9ZmuOt
	HXgR1QxLxdU3LtzIxWgZq9O38VJ9mu1kIuMuQbPMcgkwutxKcStu83NVlPH/mucXJPrT+HCdyA
	TL8=
X-IronPort-AV: E=Sophos;i="5.75,381,1589212800"; d="scan'208";a="143183356"
Received: from mail-mw2nam10lp2102.outbound.protection.outlook.com (HELO
	NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.102])
	by ob1.hgst.iphmx.com with ESMTP; 22 Jul 2020 15:13:57 +0800
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	(2603:10b6:803:47::21) by SN6PR04MB4862.namprd04.prod.outlook.com
	(2603:10b6:805:90::27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.24;
	Wed, 22 Jul 2020 07:13:55 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::1447:186c:326e:30b2]) by
	SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::1447:186c:326e:30b2%7]) with mapi id 15.20.3195.026;
	Wed, 22 Jul 2020 07:13:55 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Thread-Topic: [PATCH 06/14] block: lift setting the readahead size into the
	block layer
Thread-Index: AQHWX/E8oA9T0pQ4oE+KEOpJvS2fxw==
Date: Wed, 22 Jul 2020 07:13:54 +0000
Message-ID: <SN4PR0401MB3598470B14C754768A2D8F389B790@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20200722062552.212200-1-hch@lst.de>
	<20200722062552.212200-7-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.240.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d8ce3f04-9052-4911-3702-08d82e0ecb78
x-ms-traffictypediagnostic: SN6PR04MB4862:
x-microsoft-antispam-prvs: <SN6PR04MB4862C0DAFB1B8540DFF957779B790@SN6PR04MB4862.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oImQpW7CKR7N7nwIN1ti/wtbBp/l+aSnH3vWZaECMFtX24P/1CMnzbX29If187tW5gzPOp/Abd9iDRIChfVwCh0ocv3+uQnJ/vgQxvyw4DtEr5Ri8DnHfK21NP/3blMOzvye4EnCY1CI86qK3DwYS24zAffmZ/Zb4d5H83UZqKo7CNUzdPXa6cGsXGeH3nYtgrG3mMbbeD+wZDGBx6eHnIwTyKovexz8a+Nw+UHRh/EeeXs8IkfTGH1iBTTfhyleJni37gTbf4HHSYtqRyLlmr8N11xP2cG+oij6V4aHXQpr+fGkjiCcwy7EUvOQj/FX
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(136003)(39860400002)(376002)(366004)(346002)(396003)(4744005)(5660300002)(86362001)(54906003)(110136005)(55016002)(316002)(52536014)(7416002)(8936002)(76116006)(91956017)(66476007)(6506007)(66556008)(8676002)(33656002)(64756008)(66446008)(71200400001)(53546011)(478600001)(26005)(7696005)(66946007)(4326008)(186003)(2906002)(9686003);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: AxmEmfIEtMB/QNBNkjYO0i5tOMkxYrACo7fUJCxutjk9dK51+hUTxS9xhs0KRXjsEwHrTutRbj39rO+6WDkKMYq4tuInYXF8qvsqGG5GRkyN0uIbObp7IahQoADuB+q64e1MaWz5hJ0fLB3J2Kk+bOxcR48VpSd/SfoN0XkedZIx+CfIopPeb+EyZZFUC5vQyDARXICGh6pZVelsLXAQAD4D1BDAd7kbhYQhwwBLedQau5lz5wbiFpmdw+J8dKqMu5aJ4GgSSLl5Tshyh/De/0OlpzL50/MDQBrc5fRuIcX6On4KBc7jN47jlT2YTS9NTKD4Y47mm2WvQ6Z+QtXysI5wayIIKhG2Q/XsFZgVyZgX/YTpLLGNAx2YkSVd+oP9dZy3PRjAsShbIS1FHWBvgOjyw7NVnkZU5Ol3uANJ3yXjPI7N3lvifIXJ5o1FJlza03143dIiZEvXJrtLhFL5ao2iK06hxls/+WUNUCudWmkqKo3LNstoM9dsACcPbBeb
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3598.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8ce3f04-9052-4911-3702-08d82e0ecb78
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2020 07:13:54.9928 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wocQapUT1WYCqJh62OVuMi6iUe/l+yc5vIOJHS23u+JQnUgO7kjh9b2aj7QsttihnkJ8Otno8w8Ezb9/1OKaCEZwclMpba2Nbu1PcZUT0dk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4862
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06M7EKDq014501
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
Subject: Re: [dm-devel] [PATCH 06/14] block: lift setting the readahead size
 into the block layer
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 22/07/2020 08:27, Christoph Hellwig wrote:
> +	q->backing_dev_info->ra_pages =
> +		max(queue_io_opt(q) * 2 / PAGE_SIZE, VM_READAHEAD_PAGES);

Dumb question, wouldn't a '>> PAGE_SHIFT' be better instead of a potentially 
costly division?

Or aren't we caring at all as it's a) not in the fast-path and b) compilers 
can optimize it to a shift?



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

