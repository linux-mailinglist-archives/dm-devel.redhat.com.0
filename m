Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0D1568BEA
	for <lists+dm-devel@lfdr.de>; Wed,  6 Jul 2022 16:55:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657119323;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=czAfw99I2CZNHsYaA0Yti6/KjqQNEKcGWfbXIG6fWkM=;
	b=GMwsQodUn6N6aQq1OqMVjFdqFalyYLPDQYBsUb5bFcZNqeI+C9VpPmzuKuj+bbDvgZsu6G
	rJH8L2IhpQyzQnxs+wEo/ePgSm3MXfmZxdr50xPv119kTnYptSr77E/9qg4YO2DmC/B7n1
	js/V+b5gYI3+4BvpWsgozhd3qwu8fSg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-385-kxylopX7OzKpTfoPmHYOEg-1; Wed, 06 Jul 2022 10:55:04 -0400
X-MC-Unique: kxylopX7OzKpTfoPmHYOEg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75AA83C2F762;
	Wed,  6 Jul 2022 14:52:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5D464141511D;
	Wed,  6 Jul 2022 14:52:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 36F20194706F;
	Wed,  6 Jul 2022 14:52:05 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5D03A194704D
 for <dm-devel@listman.corp.redhat.com>; Tue,  5 Jul 2022 06:26:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3C4BC1121320; Tue,  5 Jul 2022 06:26:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3794B1121315
 for <dm-devel@redhat.com>; Tue,  5 Jul 2022 06:26:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A034381078C
 for <dm-devel@redhat.com>; Tue,  5 Jul 2022 06:26:02 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2068.outbound.protection.outlook.com [40.107.100.68]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-lWQ87DEAMxW27ss8mXwlmw-1; Tue, 05 Jul 2022 02:26:00 -0400
X-MC-Unique: lWQ87DEAMxW27ss8mXwlmw-1
Received: from MW2PR12MB4667.namprd12.prod.outlook.com (2603:10b6:302:12::28)
 by MW3PR12MB4523.namprd12.prod.outlook.com (2603:10b6:303:5b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Tue, 5 Jul
 2022 06:25:58 +0000
Received: from MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::240b:5f1b:9900:d214]) by MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::240b:5f1b:9900:d214%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 06:25:58 +0000
From: Chaitanya Kulkarni <chaitanyak@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Thread-Topic: [PATCH 05/17] block: export blkdev_zone_mgmt_all
Thread-Index: AQHYj6PzAMv498bCbUytQMJb/PvPEq1vUOaA
Date: Tue, 5 Jul 2022 06:25:58 +0000
Message-ID: <89a89371-c606-e1cf-d707-2f87bdad6ffb@nvidia.com>
References: <20220704124500.155247-1-hch@lst.de>
 <20220704124500.155247-6-hch@lst.de>
In-Reply-To: <20220704124500.155247-6-hch@lst.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dc21c5aa-3c4f-4bea-a9b1-08da5e4f395e
x-ms-traffictypediagnostic: MW3PR12MB4523:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: BqXpG7uxW921hC6PW3OPCJe0jPFOG7SKKK2RaqUK4CWcjbejHssfOXYl7Prb0QcstmmvMFeRU8yivmQSw0AJvXOHN6dJVPfb5aeBxwNFtAZUovwPW1eQQMwGzBfK7KGJXr0eksUy8x55tJOMUaO1F7JotVRQ0Ml3vmF+COVImqsa6md8QaUXvSaPgzqnzOgoIDuJG5TaBZRO+8qx/oJV6E283a45t1XtSIy5GAfoxtlWG+iZ+4xHp6KE8g84tZBfA48CQiQTbj9OuD7zyw+HH3YDDqk9mRys7OHO20WTbC4l3JPorOvU6RwF4Ov+MFTU7YBbQZy/VXTdJ6uLNQ5mjhgur21VXuE8sZ2WfKlzULRhxgJM45oMinolDIhiu+Sl1TeqJf/NQFDK4OPrv75bm90U0q9tyS8EBEDkxxTrnRQzA1rpPzLAr4k7x4jbROh2tWTYm574OXdLh1WZAGaIdDwmPASJ3buSn4CCEQ0eLX6COmqhtkM6jiYJpZlHRr88zGi4+yfWcjdHmtOY2kEwTdQlx8pBkIyW05ggL6mRVjrwN/a0HHg+AWeItrq7J3F1NfYgV7Jq2NtW4r5jb4WHO/p15tV5BCMKGwYG+DxcnoTeUYpIGEHJUXydVwZYFFeJa6+F77ccNmJveMvDKO9g5aYgwm2AuKYsU5qp3Sv2DUxhZMC6NbAX7jZB1Lbf88rKNWExI1bFX4OTdoB1Y6MkR8PpvmoZh7O/yqFy3CL81ZvqLqdF1a4wvfwiNGtBk9Na5wZ0tMfo3vLtaajrnQH5ow4x2KkjttG8n/UN4ysCtuTmHzlplup5YU4qdSceHDIHToRDJjKW+BYtNgtVZyKJnd2Es57geeYB1O8ZSMLhK1Us1pj+vNMpOa5lSwVvZ8Un
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR12MB4667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(366004)(376002)(136003)(39860400002)(396003)(6486002)(91956017)(76116006)(6916009)(31686004)(8936002)(54906003)(66446008)(66946007)(8676002)(66476007)(71200400001)(66556008)(36756003)(64756008)(5660300002)(478600001)(316002)(4326008)(38100700002)(2906002)(6512007)(2616005)(41300700001)(186003)(53546011)(31696002)(86362001)(122000001)(38070700005)(558084003)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MFJDNjUwQkpOblY2cDRsVktVc2dUbkNYaEJFMXRDNXNSQmt3ejIrbHlpWGIw?=
 =?utf-8?B?VDgwVnVpK0lDYUNxS2lLb2tXaURqZ05oWjRHc1JCV242SWZlUFhESU04VGJw?=
 =?utf-8?B?L3JJYkhDZmFZSlZsVUQyc0lZQ2l4bk1NMjM0RnArTEVuRWxFK0s4Vm5CTXNW?=
 =?utf-8?B?NTVSUERySnVGOWRPWFFubVZicnYrcmhGazVXMTN3ZFpNU2JDcVBEckFvd3JT?=
 =?utf-8?B?N3l0bXc5RzM3UFhXMWpwcXRtWjBTYWhpbVd3bEkyNEFlWmRLc0NWUWg3a09S?=
 =?utf-8?B?bVFPVHM4dTlqZGxzeDBSS1lyV3Y1TUhwQy8xK25VMENKNFVON0xybExKd2tk?=
 =?utf-8?B?bkZjTktXaVRQSFpUTnFpYXdQRENsU01UcXQrREY5cVA2NDNWQ1BmcHlkRC9T?=
 =?utf-8?B?MCtIc3pSZHh1S3Zwa0RXM3pZZmg1ODhEdmlZZVhyQUJQOHRuZTBOSGVpR0I1?=
 =?utf-8?B?ZFQwZnc4VVRnUFNzYlk2R1NrRDlnM3NZKzRJTWJydGRZUGlnTC9LNS9BZk9Q?=
 =?utf-8?B?V0c5dXF3aWdtekxPcnYzUE9Mc2tNcjMzZE5QbnJ3R21Gd2h4Ym5ldVN4ZGFw?=
 =?utf-8?B?ZW1GVlYvajRDZ3gyZ1lnQ1NpaGFCN0xxV3ZsQ0hFUGM5MHJmL21iSkpSVEU5?=
 =?utf-8?B?TXE5NlZ4bS9kSmw2cTVzbWRLb1VKNWpOY3J4aUtIdmlsVkZBakl0Q09Zc1VM?=
 =?utf-8?B?NXJsMjE0aFFrZ2pnekFBbTAycGdzYWRTN212clpmT1N5Vk1SQkU1MG9Sd24x?=
 =?utf-8?B?QjZ2eUR2RjNCZkZHcm5XRGdHZGVKc0IwSlhEMFRzR3FnZTRHdDNlQ0Ftb1Na?=
 =?utf-8?B?OW91ek5rTDhZcXNUdmlYdjcvWkw1bDU5aHJGN1lmRVFXR0JSUjVJSVRJb2FX?=
 =?utf-8?B?RWJrdTE3b0FoR2tYQTAyOEc1RTJvSzh0Z0RTb3hqWlY2K1o3RXdZeU0zZzJI?=
 =?utf-8?B?UXc2QklkK2pZZHRlajRib0hTak1vTk1WeHJkNUxQdWdBWGRDbkQ3UkFvWHdN?=
 =?utf-8?B?bWhmQ1dwU1phcTlTajdBUDdIYzVpUnFhK3JqWW5lWW13UHNScitvd3pqcjM4?=
 =?utf-8?B?L0lsaXNOdG5QMHF5RDZPL2xPOTRZTVNYRG9zYnN0TE5jTFVoejNrK1llWk9S?=
 =?utf-8?B?RGtNb3c4YkdJdE05N0F0L0V4bm0vTmlyQ2tqejlPclBFMmRlcVpBNkZqZzIy?=
 =?utf-8?B?VXpnUjkwdXIvaUUxQ2swRGdqdG9qeDZQcUxTMUQ2QkU4bndTS2p5K3c2VXZj?=
 =?utf-8?B?Mjh5Y1BHYmVCd3F0SDhGTVVxV3llZDJWWnVEY2U0blpDcHRQeFpyeE82L2hq?=
 =?utf-8?B?NXcxMlFTMmkxcjhBZTFJQVk4V3hYMWdmK1RudElDUHNMK282RVJKR2RwakVO?=
 =?utf-8?B?TERQVEhqeDI1OE1FVXE0ZTkxWkUxZlc0YmpiNzdVUEw5VDlHQ2REcU5rRDhK?=
 =?utf-8?B?eE84N2ZtRktFalZLdUh1Vm9vZXZkUm14RFBzdDl5Y1JuWERHSyttV0kvTk9t?=
 =?utf-8?B?U2FZajg0eDNsNDNnY3NRbUFUMVRDTGxLTllwb0sxY3Nla3lhR0w4RC9EVkpG?=
 =?utf-8?B?dlZxUjBSdGZoT3dEa3crVXFJeTZic2k1MFhSWldIOVNzZDFqUzdQUmRvcFVt?=
 =?utf-8?B?QUFDd1hlZERlZWxjM0FMelVMOUhKQTJOVk5hWFZvVnBQWktLbS9oN25DdnpL?=
 =?utf-8?B?UXNWQnpoRFk2ek1mbWJVREVVR0hpYVNIMUpaNlBXVGgwMEpFSHg0T01Ec09x?=
 =?utf-8?B?OStKY1ZJNFBPYmp2bmJMSjFmRXFKekVzZTRWckMzR2pIZzI1bllESTUxSTVJ?=
 =?utf-8?B?bFFWcXk2d1pnMXQ5dUg1ckdVVUd2dGY5b1d4eGNOdzcxcmtQNXhGNzAvQmpV?=
 =?utf-8?B?WHMvMnZ6QWNoQUU3REZHN3dncjhoNjBkYStlRHVkZlRzYkkxYXJ4T2pHc1FG?=
 =?utf-8?B?Ui9MU3M0eVgxUW1CenFCdm43d0dHalR6VklnRTFUWjhXdEV6REFnd3I4OHgy?=
 =?utf-8?B?MnNBbnp5Ly9LU1NhK09Na0ZFT2ZqRXFZTlBnTnkrUS9jSnVLSjRqUU9ITEQz?=
 =?utf-8?B?Vm00N1NKL0RLbXQ4SkxMWG1mR0t0UVg5bVhwT3F2N1JLNmlnK1h4OS9KZ3pM?=
 =?utf-8?B?TnVVbmlTVXl1QU5rQW1XL2hTTmFabmF6UW9Hb1R2aG9rc3UvNjQrWVBzdC9i?=
 =?utf-8?Q?HtoVAE2fpLs6mUy6wrv9klNY7EtySVb8mf5/c3m/J8+0?=
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB4667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc21c5aa-3c4f-4bea-a9b1-08da5e4f395e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2022 06:25:58.3810 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jzey6JCgW8pgjkIRwAnrWO/sH3sXKmO9OA533oRJ83exFcQLicPTNgr0X5QxCwWhVxsI4vK9zS80Hdy/duzU+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4523
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Mailman-Approved-At: Wed, 06 Jul 2022 14:51:05 +0000
Subject: Re: [dm-devel] [PATCH 05/17] block: export blkdev_zone_mgmt_all
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
Cc: Jens Axboe <axboe@kernel.dk>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "dm-devel@redhat.com" <dm-devel@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <5D27DD6EDF12DD4EB2D23C12645E3267@namprd12.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 7/4/2022 5:44 AM, Christoph Hellwig wrote:
> Export blkdev_zone_mgmt_all so that the nvme target can use it instead
> of duplicating the functionality.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---

Reviewed-by : Chaitanya Kulkarni <kch@nvidia.com>

-ck


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

