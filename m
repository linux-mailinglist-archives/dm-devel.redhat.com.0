Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id B28A52292A7
	for <lists+dm-devel@lfdr.de>; Wed, 22 Jul 2020 09:56:48 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-LyaiBBb5OCSdBiUxKx_iIw-1; Wed, 22 Jul 2020 03:56:45 -0400
X-MC-Unique: LyaiBBb5OCSdBiUxKx_iIw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2D46E925;
	Wed, 22 Jul 2020 07:56:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF0A75DA2A;
	Wed, 22 Jul 2020 07:56:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7BB411809557;
	Wed, 22 Jul 2020 07:56:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06M76u73013839 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 22 Jul 2020 03:06:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 61FD910145E0; Wed, 22 Jul 2020 07:06:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A95C11A0223
	for <dm-devel@redhat.com>; Wed, 22 Jul 2020 07:06:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 42274857CED
	for <dm-devel@redhat.com>; Wed, 22 Jul 2020 07:06:48 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-369-K4Edl55hMcKOtgYF8VajEw-1; Wed, 22 Jul 2020 03:06:45 -0400
X-MC-Unique: K4Edl55hMcKOtgYF8VajEw-1
IronPort-SDR: 1cC/ZmCXw2L7KZN7j+3FnZb6iD/zGOdmDPw2wC+8afPlAXyrtfLqQ0IHxiR6NTt3NyAY2OcsYh
	CE9ypca0AV3xIyIR0/BhLD3mCOK0eEJO0/nOcDXTrSOIDcyRbaMgUNWQAnBitZO841K6T1vHmU
	+/GmrA8sZCEMCGZJd3fdri1/Ko5X1D0WtFD4LOZLyBj0YGT+0Hr7yDdv+b9iuS4SiHyZU21jP5
	XOygclq9wl1W+l3z5n5DatFGrUzpkbKrKWRQJ4HXUTaEamXSwfzd7KuO4kD3NSlz1vAz7CLb5F
	Oug=
X-IronPort-AV: E=Sophos;i="5.75,381,1589212800"; d="scan'208";a="252374963"
Received: from mail-bn8nam12lp2177.outbound.protection.outlook.com (HELO
	NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.177])
	by ob1.hgst.iphmx.com with ESMTP; 22 Jul 2020 15:06:42 +0800
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	(2603:10b6:803:47::21) by SN2PR04MB2239.namprd04.prod.outlook.com
	(2603:10b6:804:15::27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22;
	Wed, 22 Jul 2020 07:06:41 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::1447:186c:326e:30b2]) by
	SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::1447:186c:326e:30b2%7]) with mapi id 15.20.3195.026;
	Wed, 22 Jul 2020 07:06:40 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Thread-Topic: [PATCH 03/14] drbd: remove RB_CONGESTED_REMOTE
Thread-Index: AQHWX/EU/Gp+h3cxdEuFDKhh6e2P/A==
Date: Wed, 22 Jul 2020 07:06:40 +0000
Message-ID: <SN4PR0401MB359858B7C65ADC19A58680B89B790@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20200722062552.212200-1-hch@lst.de>
	<20200722062552.212200-4-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.240.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 423529e9-2d25-48fd-271c-08d82e0dc8b8
x-ms-traffictypediagnostic: SN2PR04MB2239:
x-microsoft-antispam-prvs: <SN2PR04MB22399BE18885C4555C49EF769B790@SN2PR04MB2239.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CZ2WBoKTjUiCRczBINJPXt8slJKCWaB7VG2GIiU/jcWAzvPUpQHTcqy72iURil34lyAyUTsk7iDbehuJYJWDmFoOxwxnoKpMhoL2FFiy+o15O8Fn/xzk+W0qDZfZq9rqy6Ku8CNhZMo2YhhqDHMWhQRFhPf0otxV5YIJ7SwOqcrzvf6wA1TJxVpK3uDp68xMKG2A5lfT9IgHGmx8r0tcsqbVepSMNX7wkNAC1VRjxP5YCrteQ1NJvasmnqz9bqBg9fLQlMAl4tIX6wztxcBtC52S8ey9WOwdVwSCwTjDGkZvIJX9uLcEhLWk4P94LReVU6hUp2F8/uPmtIzAPAaIZQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(52536014)(4326008)(478600001)(9686003)(7416002)(55016002)(5660300002)(33656002)(558084003)(8676002)(8936002)(76116006)(66476007)(64756008)(4270600006)(66446008)(66556008)(66946007)(26005)(54906003)(86362001)(6506007)(316002)(2906002)(71200400001)(110136005)(91956017)(7696005)(19618925003)(186003);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: lF+WLkAW1iTv8GTT+lrWQKEw/9YFv0A2vLwi8HFMpNw2MSBWI+PnWVEZGtIeJd9hKwwQRy/HZHxu2Bfn7Sn4KsOEpudZ0WQH7wQzHmuOuPzxYIyPfNp8GlKnGk1MpDHa1qNRt42kk/Uo/RBv704eC2E2jZiY2o+bOVn8Sh9l/domlQ9896gTFJVBjan3vlqHgAYA/i6t9FIxB02qKwq2akOmkLrjsC+VwS0VIFtR59y/iUfEYYYUQjwencUfqY//y/UYcONBlWatvTTFF/OsIWCoUnulDa/oTPPdvotwB1ryB4XisFUZ2pBdUPDjG0wU7jTWywaaboZTDf9dOR1qc0/zg4jP5DRIgDN9OKil/jzIps4OsPRGaH9vjS9wwCelgBbkIR8V9Va8En/ZFPMVPcxEsw1TXOtTU3yzmcNti2d2s2vZ9qr+CZgfssA4frMB3uTF+B0CmIMZI/avQ8Vua+Cwp2suY9K0pbvHuugm122kMzlJ4n/ZzhXKyZSPGLwN
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3598.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 423529e9-2d25-48fd-271c-08d82e0dc8b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2020 07:06:40.9030 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 69clVlzfq5RK22/6bqsJwMAzhrFxun4DqnADjbPPMnMgSFFvB/DDmpxjSlrTkxFvCJ8XY7liRo80WXv/vIV97xHvradsQ9JdYVBFdz5AZWI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR04MB2239
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06M76u73013839
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
Subject: Re: [dm-devel] [PATCH 03/14] drbd: remove RB_CONGESTED_REMOTE
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Looks good,
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

