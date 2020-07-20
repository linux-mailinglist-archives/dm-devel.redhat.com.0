Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5E194225BAF
	for <lists+dm-devel@lfdr.de>; Mon, 20 Jul 2020 11:32:08 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-tlinvj04PWCNIvUMJR4Mcw-1; Mon, 20 Jul 2020 05:32:05 -0400
X-MC-Unique: tlinvj04PWCNIvUMJR4Mcw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94987107ACCA;
	Mon, 20 Jul 2020 09:31:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF3FE2B6E2;
	Mon, 20 Jul 2020 09:31:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 01D949A135;
	Mon, 20 Jul 2020 09:31:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06K6jYIZ005245 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Jul 2020 02:45:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E76F4CF606; Mon, 20 Jul 2020 06:45:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DEC60D74AE
	for <dm-devel@redhat.com>; Mon, 20 Jul 2020 06:45:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14B4F83B9E9
	for <dm-devel@redhat.com>; Mon, 20 Jul 2020 06:45:31 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-111-VyVk7bYaMPaLwcp5g1ClBg-1; Mon, 20 Jul 2020 02:45:28 -0400
X-MC-Unique: VyVk7bYaMPaLwcp5g1ClBg-1
IronPort-SDR: XZFb0YYshGCcl3Qb6k47eCmhMKbGrqnQYmTrpqc89Cj6uOX1LXAnO89Gc730eltIpMovJn5gNJ
	hEOkW9Q7Lh0D2757Soba4E0NCfnfhau27sIL+wfN+zO00sHY1OamaDF9sN4lx/f6xjxSulmEgz
	UAUFwvqRemUNghOB12+M92qTN/BesCtJ4JrlqkFhOfAMSuf5DZEKQPAC0u/kQc2yY1jfL8frXp
	ohvsuisFtoJII3OGeT4D2Xl6kRioQRYaItH+8whHgEN33WwotRGnHGalfFwvlYiUxZa57KyaNk
	C9o=
X-IronPort-AV: E=Sophos;i="5.75,374,1589212800"; d="scan'208";a="245927121"
Received: from mail-dm6nam11lp2177.outbound.protection.outlook.com (HELO
	NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.177])
	by ob1.hgst.iphmx.com with ESMTP; 20 Jul 2020 14:45:36 +0800
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	(2603:10b6:803:47::21) by SN6PR04MB4688.namprd04.prod.outlook.com
	(2603:10b6:805:ab::10) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.25;
	Mon, 20 Jul 2020 06:45:24 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::1447:186c:326e:30b2]) by
	SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::1447:186c:326e:30b2%7]) with mapi id 15.20.3195.025;
	Mon, 20 Jul 2020 06:45:24 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, "axboe@kernel.dk" <axboe@kernel.dk>
Thread-Topic: [PATCH 1/3] block: inherit the zoned characteristics in
	blk_stack_limits
Thread-Index: AQHWXlzTaXAJlznby0qGepPx4bGhoQ==
Date: Mon, 20 Jul 2020 06:45:24 +0000
Message-ID: <SN4PR0401MB35983F8986A949FCEB79A3829B7B0@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20200720061251.652457-1-hch@lst.de>
	<20200720061251.652457-2-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.240.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8791f423-e514-49ee-3b36-08d82c787afe
x-ms-traffictypediagnostic: SN6PR04MB4688:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR04MB4688858CD766868232465B229B7B0@SN6PR04MB4688.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gEYEcGcAuMQfRDQF3WmXNSXfkIfJF9dw3FUXLY6pScGIHl95UD3dl3XnTZCyyICkOGVrVB3p2H+kRTFkBDKA0i+1OcUqvB/HtLUvF/FrRyuxDj2CokTZatbjpgLdCmP1qyd/43YHEkQBfo8DElnNLt8VNQIrD8bGgsdZZ8qHTXE7WFmVU2KshcwgpEkQ8npvTjzgJyBz25HnS2JFbn4Y/jSuLT3QRxyM1tQ6IouRTn8KSdoV02G6K5qaZIIy0iv+OYv/m4OwabGVs9n+atxDb47kYSN6Uoni+AE/ikyaJ2b1zYwRa7qljt/eX5HksdOis12pJfhmbxLfqmc6DXc2AA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(376002)(39860400002)(346002)(396003)(366004)(136003)(55016002)(9686003)(7696005)(4744005)(83380400001)(52536014)(2906002)(478600001)(8676002)(33656002)(91956017)(71200400001)(110136005)(54906003)(316002)(5660300002)(86362001)(8936002)(66946007)(66476007)(66446008)(53546011)(6506007)(76116006)(4326008)(26005)(186003)(66556008)(64756008);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: oGXxLKMsZEQVk1EQWWYMBnZhnXzlEG4A9/YXEEtefrXnzyK3/XWtCN5yvEDrocGGUr9tehDBzrvzczilKRYYfU//k6DkQno3snqAQQDdoG0ZlMjFePOV35qpigdpqJMRxbjnZ0DVMtsjQA/Ox04LW5Rvee658D19TWh0JP5g1g9ObVCFWReW0P8NCuCqe+A/BlzU9ZDiGpKUdzOMv05rnIu+9cFenWxDmvtpJQ8QS9ZVItrRbgEWY4XPcs3LWih4F+wkc9BZivakJnTqIfr2hXTPLma/OlsMol7UJ7+AljJlwPzAQ879ALH1Qfn+4OoFmJhJJy8Q+jVkZcsExyT5hRpal8oI5/R9Vo+Ix0JtJurv1iQ4soMI7LJxkc4mrgtW8mOjf42gQN/5P77u6WPqGh6RGXvoYA3C7LI+iLpXwF/aeJtqxz8ODk7ZI1F375RyA3/ukJ6Ij7yqgsAxJrjCIoc3+bSLb7UUN/M1OQjUs8VUmfNVCHRnWJvT3/Kejgqf
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3598.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8791f423-e514-49ee-3b36-08d82c787afe
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2020 06:45:24.2705 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hbv6FPzo9+LWIRaepatEZF7y8bEK22IXguDSqKOrqGuBTC2GWcKENmax7mLKBQbfIcIxaxR9fHrB0V0UwKE0pzLNKx/e/4M5ZZvhIQm/rKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4688
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06K6jYIZ005245
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 20 Jul 2020 05:30:57 -0400
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Damien Le Moal <Damien.LeMoal@wdc.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/3] block: inherit the zoned characteristics
 in blk_stack_limits
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 20/07/2020 08:13, Christoph Hellwig wrote:
>  /*
>   * Zoned block device models (zoned limit).
> + *
> + * Note: This needs to be ordered from the least to the most severe
> + * restrictions for the inheritance in blk_stack_limits() to work.
>   */
>  enum blk_zoned_model {
> -	BLK_ZONED_NONE,	/* Regular block device */
> -	BLK_ZONED_HA,	/* Host-aware zoned block device */
> -	BLK_ZONED_HM,	/* Host-managed zoned block device */
> +	BLK_ZONED_NONE = 0,	/* Regular block device */

The initialization to 0 for the first value is not needed.

Apart from that,
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

