Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 893A6568BB4
	for <lists+dm-devel@lfdr.de>; Wed,  6 Jul 2022 16:52:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657119132;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bGv20zwgBrzqyw/bBBIRoNX88zmda5CYJlb5+ixoEAc=;
	b=exL99dXd61UHbAbtWiOGsWaWb3WpAsuam7meuiQFrklyffSuPMSNYlXCVkrpVdi8Q+WowR
	fXvlJN64xLx47f+UjvvZAJsl9p7w7mVSgHA7yhuhxAQhAgKPTnlwo1vaDY4s1l3iFzKid5
	HPEU4MiJuVROkdvp7Yh4ZI3fvH7MPtQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-pYbDNeTWPXi-QSCwXsqn9A-1; Wed, 06 Jul 2022 10:52:10 -0400
X-MC-Unique: pYbDNeTWPXi-QSCwXsqn9A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F31D833A28;
	Wed,  6 Jul 2022 14:52:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 27FFE18ECB;
	Wed,  6 Jul 2022 14:52:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CB43A1947065;
	Wed,  6 Jul 2022 14:52:05 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4910A1947057
 for <dm-devel@listman.corp.redhat.com>; Tue,  5 Jul 2022 06:42:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 35B8BC15D58; Tue,  5 Jul 2022 06:42:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 309B4C15D42
 for <dm-devel@redhat.com>; Tue,  5 Jul 2022 06:42:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1866829DD9A5
 for <dm-devel@redhat.com>; Tue,  5 Jul 2022 06:42:40 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-n6qXpUHGMBiBARU7Gzm8nw-1; Tue, 05 Jul 2022 02:42:38 -0400
X-MC-Unique: n6qXpUHGMBiBARU7Gzm8nw-1
Received: from MW2PR12MB4667.namprd12.prod.outlook.com (2603:10b6:302:12::28)
 by CH2PR12MB4837.namprd12.prod.outlook.com (2603:10b6:610:f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Tue, 5 Jul
 2022 06:42:36 +0000
Received: from MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::240b:5f1b:9900:d214]) by MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::240b:5f1b:9900:d214%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 06:42:36 +0000
From: Chaitanya Kulkarni <chaitanyak@nvidia.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, Damien Le
 Moal <damien.lemoal@opensource.wdc.com>
Thread-Topic: [PATCH 13/17] block: replace blkdev_nr_zones with bdev_nr_zones
Thread-Index: AQHYj6QEyQ3cQdKvGkWmk7qRtNMn461vVYyA
Date: Tue, 5 Jul 2022 06:42:36 +0000
Message-ID: <cf1ea2b7-8de2-3217-669b-875593c2f467@nvidia.com>
References: <20220704124500.155247-1-hch@lst.de>
 <20220704124500.155247-14-hch@lst.de>
In-Reply-To: <20220704124500.155247-14-hch@lst.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5288ee8c-b386-4977-ce19-08da5e518c00
x-ms-traffictypediagnostic: CH2PR12MB4837:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: GqTpphg4R2JBKBu7LRdjW+mrtdjfN8Bl32bDWKq4ynhj16XerzQGLacVNRcWLp2GlpFjtjEE574B82SU7yhx3i2nQvMwhbdvCC2zVBpF9+GSj5A//0y583LAxJKTO7UnBptKqH0twcuil9Uwe2lsHp/NP/qdw8Ed979icT+kB1zwSzXB5dKs/fCVEq2wyvr1JwFy8VC6tAx6WnLRT+GbRlSWecOd8Vc6VoQaks12zuDNHHqqmmKLu5jdIrdUuQhLHgLBxjG3dkTj1MBBhDeMwSvav/bxmJqbkdBIdlxKpvSvpBYeMZjgfHPonVebBoZqPpyPHbLAR7qwsZT46W66IKcNqXyCr2cIsAYSoJjwJDoumgNEJDXe3TjO7FD6lo8Gw8uB7630F6ol/CF1uqAc2jlprasPwJhDVPWVXND23Awxn00DkLbNfb29OTV7WW3/BAGgikTAxi/HPnpCcUxCLYeX6NQahUksnmFNXCKCaTXJ5O3WfdejIIqE4G2Fq0lLeX/OkckFIzq7g1D1pforTEtDLBadl/Y2OBzxgwbwzk2IptSu34yl62FXnQ0Ii/DxKMDadbGfRYJHVK2bzWX7XragBEM9//sUotlROXHDJCvOsrITssQZzSCS+TS8V4MZQtui95EV2I+CZksBGy2oVtlMbF39uqlteG0esIfI0u2ocGQAwJE8rHDHGLqDnbpfSAxyStTYYEqTI0v9Gm0TEdLM0e/U7wXMiM5W1DzWGH2UeKSam3p8OVS43y4PzA9/fNSEgvWfEywu6CNPsyPNEvjnZSVDKnBP834UxUnQYqiavt+uaOUxJe10Sx3EeQlW7G75n3Nt5he+Z4xH97CjTPVvs7jyovgRg8Hwg6c4gSGbBFRtUfFspW1OtLgV8RWl
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR12MB4667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(396003)(376002)(136003)(346002)(39860400002)(8936002)(31696002)(86362001)(478600001)(6486002)(83380400001)(5660300002)(558084003)(2616005)(36756003)(186003)(31686004)(316002)(54906003)(110136005)(38070700005)(2906002)(6506007)(6512007)(38100700002)(122000001)(41300700001)(91956017)(53546011)(76116006)(66946007)(8676002)(4326008)(66446008)(66556008)(66476007)(64756008)(71200400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d2ZETE82T1pIang4dmR0QXQ0RUJnU1JxaS8vdVJ5ZXUvM0VkTlZETjFCUlFO?=
 =?utf-8?B?bXBIRFFxalNCMjVqOGcwcCthMDRNeE9zRE9pdllNUWV4MUtkM3ZGNlovbmM2?=
 =?utf-8?B?TGNyMTZTMnVWMTQzLzJ0Q0lhTmJpL1JYY2hWQnhGdFR3MkwwekhzdUQ5M0hq?=
 =?utf-8?B?cURMUVhYbUtMSldCZS83bnBUNUVVTXRZK2R0dlArWkMxVDdzdms4bEZVTzhj?=
 =?utf-8?B?blRDUDBZL3Zycjd3RUh2UjdpOWtXUGVXRU02MVUzWldKcHZneXl1QVBvcStD?=
 =?utf-8?B?V0liMktwUFo2c0ZycFhhTDUrb3ZJSEtXOUZ2UmRrYjBvOE5taFZQRWsveUFk?=
 =?utf-8?B?U21FV0JBSzIrWFpTYTloYnNCQjFWR2R6dDBGbXdkTmtveVRrdlZEU1dsa2N6?=
 =?utf-8?B?NDI0TDk3ZnhFSmVwNzlnTzljSUtqN0kzK29tNHF6amZaUHZnYURmc2dOZitE?=
 =?utf-8?B?NzYreDRZSUd2akZUeTIvNW9MdzJ2TkFYa2tvU3hVSThVVzVMRjBXbGlSRHJC?=
 =?utf-8?B?YnE5b2s4b2l5cFc2T2hLaVlpQy8wKytUd0VqSG4xYi9OTjBWcUFKem5VeHZM?=
 =?utf-8?B?UUxaOUFrTVdid3FjNC9OL0c0Y3loL2pBa290VnNza0NRRW1mTmtxSEUzODNJ?=
 =?utf-8?B?RlhjTERaU1F0ampTSkFRWVMrMXNHS1ppM3c2Skh3TVZVb3ZmVGtYZ3F2VEhm?=
 =?utf-8?B?eWlSWTloNEpxSHhqVXF3OE1HUkFUN2VnbXRXRlNYTXFuQnVQNGJGWUtXOUlm?=
 =?utf-8?B?TU53ckd4SDQvTnNldXhGU2hDSHBRR2Q4bWdkcUhPZXc0djQ0M01QMmdyUFdY?=
 =?utf-8?B?YnJ5MXdGZHBvVmFpc1hHNVgwUk1xUkVrNnRuZmp6VUxTRGZtU2tMMG94eU04?=
 =?utf-8?B?b01GRUxvOVJsTlpUWThzNDZoblZWQXZlZDlma0luWkdDeXV2a28wNEF5Smh6?=
 =?utf-8?B?OElTM0wxVnRHMlp6eTd5bStucEl6eWxieVdJc1dVZFYrMUt5bng0RjdRRXAx?=
 =?utf-8?B?dTJwbGVXNko5TU5kM0lJczM1L0YrcC9ENXh1dkxMd0ZVWWUxVlVoMk00M3Nu?=
 =?utf-8?B?VUhmVUVTQ2dTRytvMlJPYlBiNGJJblF4MDh2TklTd2Z2UmQ1SzJLU2lsWTA5?=
 =?utf-8?B?OWdTa09yUWlVU1pjbE10WGQ4YmszT0IrWmo1K3czSUNNbDR3a1dCNEM4bmVN?=
 =?utf-8?B?dDBUQmtoZERaZmJHanI3TUdWN3IyL05NTmM4MWlJNnRiQldtQklYQ3EyZGJZ?=
 =?utf-8?B?dWNXT0VNYVlGVXZxT1F1NHF2N0MramtvUmk4bDZoZUh3U1V3b29tbzZOaStM?=
 =?utf-8?B?THlHZHFJWk0vdGRub0tSVTlXYTZwSU5TVzRXbFZQUEZwUDFKSUwwczlqRk9J?=
 =?utf-8?B?SzI1cStSRUZITlVTSG5EbUNDSUdJby9jdWVJaFZsZ1lPYmV4WUJFQStrMnQ5?=
 =?utf-8?B?Q2xyTTFkazdkN09VOXJ5RXpwQUF6MXZ0bGFmNG5rZW1vQ01YczN0WVEvUFdr?=
 =?utf-8?B?a0JsRG1pbFNwdXdtUDN2eEtuTkFKbEd0dnVTWFp4RjI1MTFKeEd2aWJNNi9I?=
 =?utf-8?B?WVNzTytSaXBoRDliZ3BzTjFhSnVyNzNFeVhQdUJNTHNsQmdJbnZCMDR3KzR1?=
 =?utf-8?B?bTZuNWVOeHlJMFNwUjRvQk5uZEhnRGNSNHBUYVhiNlA1d3dTc2FqK0xDQ1Yz?=
 =?utf-8?B?TmZIM256OVpoSHEyRDB0WGd1Qmk1NHNrcU44aDlUOXNBaUNzeUhKcWxXd2M0?=
 =?utf-8?B?UFcyT25EZFVwVEhibW5yTEFXUGZFYVFmc2JTNVVzN2tVRHMwdmNkRXVYc2Jq?=
 =?utf-8?B?MkVUNWZjZFRSWURnendJelo1aTNaeUM3QzFveHFtNXpxblBicUdOajlQRUVB?=
 =?utf-8?B?MEJlYTRrZjlKQU5ZV2prcFN6RUloV0t2azRmbEVNcThNeTF2SGJ5RGV3aVp1?=
 =?utf-8?B?ckdXWXRaM2EzTWRtaHFZYUEwWnFRV1hSemxROFNqYWdIQ0FwQ2ZseXlUZmVr?=
 =?utf-8?B?NENxOE0rYU5XK3o0cDFEVjd3T3V6TXo2S09uR3R2eE1FNzRCNkdOSXJnNmF3?=
 =?utf-8?B?QUdHMHVCekg5bXlORDJYZTRXTlVVUEw0OUxYZlowQ0x2cG1XbjlMTUpjMWhN?=
 =?utf-8?B?UjBKOGhMMjFnNWFuM0RLSW5QYkJJVHhqYU8rbm9qWklzVEViRE5raE4vdnRG?=
 =?utf-8?Q?jprFIdPQNb6atdqCR+oX/+oTbHLx9AXSqLaC+66yT9zE?=
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB4667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5288ee8c-b386-4977-ce19-08da5e518c00
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2022 06:42:36.0415 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DursRe41LgAl59MWbFo1ATovFHE0VlF63CSct+PlrR/vT+ycYRbyFTzPVTzlKQutatNzaqNFXpkECvGho1K6+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4837
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Mailman-Approved-At: Wed, 06 Jul 2022 14:51:05 +0000
Subject: Re: [dm-devel] [PATCH 13/17] block: replace blkdev_nr_zones with
 bdev_nr_zones
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "dm-devel@redhat.com" <dm-devel@redhat.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <3EF3C9EA19F5FB40907675D8DF845A27@namprd12.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 7/4/2022 5:44 AM, Christoph Hellwig wrote:
> Pass a block_device instead of a request_queue a that is what most
> callers have at hand.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---


Reviewed-by : Chaitanya Kulkarni <kch@nvidia.com>

-ck


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

