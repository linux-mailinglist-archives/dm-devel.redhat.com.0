Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD857254AA
	for <lists+dm-devel@lfdr.de>; Wed,  7 Jun 2023 08:49:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686120544;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=b8nRu+Slqyy4Er+2YcyfQxdgOB8D0/sXu5aPZ9KHoUU=;
	b=UxPywPsXCtXwUXqw7v5lAjCRNBOT1kEQa72VSMKiqgzymW6O2fdUyciToDFAl28zVImTES
	zhrWPW2o01clbmAwWgyaxWegaKHvzIoqx+2h4xpjQ62b/xlXGii7bch7/+Zwg0KBgsKzIt
	vOTZZe6Jq1wlgeDQWrIP3bJLq7yBsYk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-Mz58eRZqPtauLZx7Q1qehA-1; Wed, 07 Jun 2023 02:49:02 -0400
X-MC-Unique: Mz58eRZqPtauLZx7Q1qehA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BACF7385557A;
	Wed,  7 Jun 2023 06:48:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6B88A40D1B68;
	Wed,  7 Jun 2023 06:48:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9EDA019465BA;
	Wed,  7 Jun 2023 06:48:53 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8971F1946595
 for <dm-devel@listman.corp.redhat.com>; Tue,  6 Jun 2023 09:15:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2C8031121315; Tue,  6 Jun 2023 09:15:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 238861121314
 for <dm-devel@redhat.com>; Tue,  6 Jun 2023 09:15:54 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E3747101A52C
 for <dm-devel@redhat.com>; Tue,  6 Jun 2023 09:15:53 +0000 (UTC)
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-391-ZCNDSfRbODWBRn4J1EfPow-1; Tue, 06 Jun 2023 05:15:50 -0400
X-MC-Unique: ZCNDSfRbODWBRn4J1EfPow-1
X-IronPort-RemoteIP: 104.47.59.175
X-IronPort-MID: 110493365
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:twFP+aD4uAgPQxVW/2vjw5YqxClBgxIJ4kV8jS/XYbTApDgi0DQHy
 GQeWm3QPv+JYzb8e4xzO4m/9k0PuMLRnYc3QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMs8pvlDs15K6p4G1A4ARnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwy8xvHFxz8
 MUjdh8rTVOOp8+Qm7K7Y7w57igjBJGD0II3nFhFlGucIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI9OxuvDW7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqyrw17SUw36TtIQ6Jey7yKFYpBqqmGUpGk0qVWWK5tf6oxvrMz5YA
 wlOksY0loA++UmqZtj7QRyjoXSAswIcWtxfCOkz4keGza+8yw+JDG8JZj1MctorsIk6RlQC3
 1CKt8nkCTxmrPueTnf13qySrC+gNDI9LmIYYyIACwwf7LHLrIR2gh/RQ9JLCqO5jtTpXzr3x
 liiqSEkgrwJgM0j1qOl/EvGiTahupjISAEu4gzdGGmi62tRYI+jepzt41zc5vVoMomUVB+Cs
 WIClszY6/oBZbmJlSqQUKAOEauv6vKtLjLRmxhsEoMn+jDr/GSsFahA7Tc7KEp3P8IsfT7yf
 FSVqQ5X/IVUPnahcelweY3ZNigx5a3pFNCgWvWKaNNLO8J1bFXeo3woYlOM1WfwlkRqibs4J
 ZqQbcerCzAdFLhjyz21Aewa1NfH2xwD+I8afrijpzzP7FZUTCT9pWstWLdWUt0E0Q==
IronPort-HdrOrdr: A9a23:WlCXJ6izZomWYod5M3i6+IcOw3BQXvoji2hC6mlwRA09TyX4rb
 HUoB1/73XJYVkqKRYdcLy7WJVoBEmslqKdg7NhW4tKLTOW3VdARbsKheCC/9SjIVydygc379
 YYT0ERMqyJMbG4t6rHCcuDfurIDOPpzImYwcHj8kxAZStKL5tNyDoRMHf+LqS+fmd7OaY=
X-Talos-CUID: =?us-ascii?q?9a23=3AxtPPSms+63RXRacq9Ic+Uywc6IsUWGXA8UrVGnT?=
 =?us-ascii?q?mJkBKC7C1ZHnL+KNNxp8=3D?=
X-Talos-MUID: 9a23:BQdX2wUXPVkvJHLq/A69hw89BuMv2vqnMlJdrZU4io6qdgUlbg==
X-IronPort-AV: E=Sophos;i="6.00,219,1681185600"; d="scan'208";a="110493365"
Received: from mail-dm6nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Jun 2023 05:15:45 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA3PR03MB7394.namprd03.prod.outlook.com (2603:10b6:806:3a1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Tue, 6 Jun
 2023 09:15:44 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6455.028; Tue, 6 Jun 2023
 09:15:43 +0000
Date: Tue, 6 Jun 2023 11:15:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Message-ID: <ZH75OTMA6N3zYrH2@Air-de-Roger>
References: <20230530203116.2008-1-demi@invisiblethingslab.com>
 <20230530203116.2008-17-demi@invisiblethingslab.com>
In-Reply-To: <20230530203116.2008-17-demi@invisiblethingslab.com>
X-ClientProxiedBy: LO4P265CA0082.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::15) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA3PR03MB7394:EE_
X-MS-Office365-Filtering-Correlation-Id: 95ab2c26-b2f9-4bf0-ce38-08db666e9af6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: 3PUe+1zMqD3QyVgHFO6fhezAcM/bYjaU8Wfw2MHH7zw8YXr0SQwAgMCScV6UYEcR/1Z9wFYBeDlwTTrOvoCFiY1ZxURFINlCFeoy4Rf1RLa/YMxo+xTkEGp4DzInsyS0idLe7XL2nEDjJ0itHYHFV6P/SZnq71jYyyJZn9dpqdezkNwe9a59H2nsf7+qFcUNu7wbjnHeOH19jouNexQ3U3cthbnnZTAGQn3dAOgQV0jV9yI7J2DDwvfVcUgjXvGXJv0pbuY+rLvM72k6iqfj/1mTyT7jLfbaxe7vsrjnyqd0tGUxNNUnGHm7PlFKtMTdZ19r4yPzwMnq+XqtkgoWOwqIa44ddhfJpbhwN8qkoQPaMPy0t7BQbdR3pI/XTvVbJhaVq7VsFRtMekNYRMq9CbsORo8G+fPY++xBdHQNEgwAVTRnsnRf9y4GP2y369sW8JeMQycNPMynPelFbqsvSXEujLuTEofp1Bv1358kyQDnlya1Ts7w5p6+dyX1N0IEoNGCrIm7CSXniribTQyuq28Q6cTRsYGYVnCbJKEmlIIfijspWfg7nP2B0tYGHOzA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR03MB6423.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(7916004)(346002)(136003)(396003)(39860400002)(376002)(366004)(451199021)(9686003)(26005)(6506007)(6512007)(85182001)(83380400001)(86362001)(33716001)(38100700002)(186003)(82960400001)(8936002)(41300700001)(54906003)(2906002)(478600001)(66946007)(6916009)(8676002)(4326008)(316002)(5660300002)(6486002)(66476007)(66556008)(6666004);
 DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3JYZmVWZldIU3Nna2I3Rll4WDczc2pRbUd6RkVlRnlwaGYxZ1liWEVPTUFR?=
 =?utf-8?B?bVZzdTBROHhUNWowQi9sYWZ2d1Q1ak0rdkhXSEFQTzRra2JlalV2cHp1VFha?=
 =?utf-8?B?emF3S3JTVlRmMDZYa1ZzWU9yU0ZvVHZlRGtYQVdid1pZZENva1VTakFkSWN1?=
 =?utf-8?B?S01iR3p2MVhsV1ZLV05oY2EyTE1YV0FuUC9HbjhkbDR6SkU0MFB3VG5QUkk3?=
 =?utf-8?B?Z3VZNjl5QkRLVnd5ZGx3NXQrSFJBMEI3MVB1Ui93UVpuWmFvQldZU2l0QW9P?=
 =?utf-8?B?TE1mNXRpSEc2cjJBQ2tBYXRZdlY5UWhZcjg1d0NCQnBKUFlubHpqaVJya3Mr?=
 =?utf-8?B?bUF3R2lzMTRiUlRiTFdSbjI4VGZtUTVwQUNWdFVoSW00VWlSK1VMVVJKUjIz?=
 =?utf-8?B?MkFNa2hxWkdueGgzK1Y1Tlh5ellXeFFMWWFHV0ZEK3N3ay9WV01zTzBiaTZV?=
 =?utf-8?B?UzF3dERlbXhkSXdaVEFockU5V3JkRUdYUTNscmZ5T0JKL0pBLzBEd1l5eE9K?=
 =?utf-8?B?cXFVNU9OZ01LMU92ekk4TlV5aWxnZXNqbjZxcEQ5Mys0NDhFczBDRFBxNUVl?=
 =?utf-8?B?TzFUMjVvWmt3NkRJV29YbHhMYm1FTG1ZSVJmVzFBRjNZdzB5a2FEK2txNGx1?=
 =?utf-8?B?bG0zcWtQalF2WUI3SVh3NU1hZkVldUFBWUJnSHFPcDJEOGlKNXFROXFnc1hs?=
 =?utf-8?B?cmlJWTVCbFNyU3k3M2pIeTA2STErNDdDNGVKdVJjQ0s3eHFYb1l6TFdteGZE?=
 =?utf-8?B?QzBDVGs0UlQ3VllMTXBTUkh6NHBFYjRPNnVFNGV4c2cwZ0VxOWg2SVBQeFgw?=
 =?utf-8?B?Z2VrQ04vcHlEaVp1ZlJCOXJ5VCtZTUVQRVUxdVBoVkdTZ00vMWtLUVhabC9R?=
 =?utf-8?B?S213Y1hFNlZjcFQ1K2xZMHlSa3RWdUpWOHVrUm9ZL2N2VzVrNDY1anNYVUd3?=
 =?utf-8?B?a0w0c0NKMXgxODczclNUWGo2M2lmRnZEMGZwL0k3RlYxc3FMLzZ1ZzM3cWl4?=
 =?utf-8?B?dnVwTEZuKzJJbGdRQU9YcHVnbENyMm5UUGowemUybThkWGo1NXVUeTA1ditm?=
 =?utf-8?B?MDFNdkxlRTNGdEdiZU9ybTF6ZTVsMHFWL2JjbUppQldKYXJYY3c4REYwMmFK?=
 =?utf-8?B?b1ZsSGdZNlc4S0o4dkwzTWQ2dnJ3TUNRSExIclN1NzJOZnBLMHEzV25lSXlV?=
 =?utf-8?B?c2tPbEVMQkgwTURiaHJwc0lBQjk0bnFQMEkzVnNleGZNSlRSc01pbWdKeDZL?=
 =?utf-8?B?VWpISWlsamJWWDE3KzJZVml6WEp5MzJsNFhickxaMm9rOVpIMVh1dHNJWmlJ?=
 =?utf-8?B?ZXAzQ0cweHBvYW55UUhqRDFqc1UxcVhMelRJS3dqRytkQjV1a3dCVHY2dURr?=
 =?utf-8?B?VzM3RHdvMW03enR5U3cwSUNFSVdSeVdXQXQ3eUpnZmtGMTliOWZxaFZGKzM3?=
 =?utf-8?B?YVZLdzRpNlB3YUFUYzd5RjUwemdlQy9Ia3BWYk5Tc3NIMmdmVTFKd2ZWakl6?=
 =?utf-8?B?eDJsbTdNTE4xRk5TU3FGM3YyMU9HWGh2VFZmT0Vwd3Y4VDIzc3dDdTBRNkFR?=
 =?utf-8?B?dHYwWllxcTgvL0NoME10clJsWndSbU9zSTRpaVViSlNRTDdGUG1xRHhnUXAy?=
 =?utf-8?B?WktnVTdVTGxCUDhFdU1sY2pieVk4ZERXVldEUm1rYlFmRzJVcDRRcE4zc2dq?=
 =?utf-8?B?SHE1U0Q3ZG9GQUhjanRGMmd3dnhGTmFWVlZ2TFVLTG5sRGVpb0syeHF5RXlQ?=
 =?utf-8?B?VGxUU090amVjbUd3UlM5OXpqSCtSRVlKaVR4K2VVWnIyaEhIbWtpY3RXSkw5?=
 =?utf-8?B?UU14Q0NSV0dnM3I4WW92Yk5RSDNXZFBKeDZMMkdSTzc1MUdjWkRYUWZQdVND?=
 =?utf-8?B?bk1nc0xGWFhNYnRGc0JkK09DaUFnWElzY1NVYWV3RlJrUGFoelhyNE5FSG5C?=
 =?utf-8?B?L1ZTSGdZRzJ0aUdZcnZpMUx2WitheW42NUpJZnFhc0I3Q0QxVjlPNHUveFlU?=
 =?utf-8?B?Tm9UK2xzZ0JJdkVGbks3S1Rhdm51aVduY0EzYk9sTUxRSU82REJFQWNzMkRS?=
 =?utf-8?B?L2M5SFJkdG1NN0J6NEx4Wjk4dHBYdVpyYkdpTEhpN0M4dk5Ua3lRZVVhQlZG?=
 =?utf-8?B?TnVaa3dZMFZHM3E5T0tvQzdlSUlRVUV5QmYrWHZ6Y2NkUmtRS1VoeFlRbUpC?=
 =?utf-8?B?MXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?VmtScTRhaGgzTHI2RERLUU5HTnV1aW1XOGU2VVBzbkxQU0dEWGxBN1VBK2Zn?=
 =?utf-8?B?TFBFb3JzWnp0NklTcU5JcVJMc0FIZSttczVCa1lNbTNmdkpPbnhTK200RnRj?=
 =?utf-8?B?M0g2Rm9UVWR1QXZ0MU44ZVJRMTZRakZrVUgzOWVnU1FtQmZDNk00Y0h3NmMr?=
 =?utf-8?B?SFNBdFlFUFNrZ0JOUXQ1UmVxSXE5MW4xV3RCOXpMK1VPbnRjWjVLVVJhZ0Ft?=
 =?utf-8?B?SExIZXZ3SysrQnJLQ21EMFdXOXhncEFKdHVSdk5VbEM0RUVrbkdkeEVJaUgx?=
 =?utf-8?B?ME9tckxaZ3k4WGxYYWJrQUs2VU1TSjZQS0FVSVhVaFdFSmxtVTU2VHEyazlT?=
 =?utf-8?B?ZXZJNExYbnVzd1FLVTlDVUpQYjQyWnBKM0c4UXpoVEFOQ2Z5SGVMU2ZrdDZj?=
 =?utf-8?B?dWM2THMxQW5raTZWZmJ2OTBkQ0JJcWFzWEtYYXl2MThqZzMwTms4elhIZVNp?=
 =?utf-8?B?VmJheUg0cXl2cUNpZEU3NG9DWWVyQVQxc3hDZDRreXh4VURsbkxhTlBhMzZD?=
 =?utf-8?B?cENTQ0pIU2ZON1Q0S05ha3hYU0tvSU9rZEtPU2ZnNDQxclRSWmVGVmVvb3Q3?=
 =?utf-8?B?UWR6Y1dobFFSKys1QnZBOE45V1poZTd6eC9yWXpWTDMrVHVGNnJBdk1EODEr?=
 =?utf-8?B?QUNLTUhTblQ4eXdiVXR4YkoxNitGYXV4cGdTNDdDYlFtU21xditBZ2R4aVV4?=
 =?utf-8?B?QzhsR0FudkhrcXpLV1lzNVFQMGQ1T2dCeUc1dkk5bC9BZjAzV3QrOXdXRm90?=
 =?utf-8?B?RkdFR01iMGFkckdDNTZveFM3S0V0R3RRb3NVOHVPaUNUUnVLMzRlaDg3ZUtE?=
 =?utf-8?B?c2k1ekVhNE44b1JYcUFnaWxQL0gxRmkzYXVjbHBmWGN2WVNiR3lPUG10c1cw?=
 =?utf-8?B?NU8zVExQeDh1U3JPSlFMWFhjcjFBNEZhNW5La2xIUGVpenJGeHpQckk5K2ww?=
 =?utf-8?B?eTdqNFlXNDZPNU5FU0JsSjJ2M3gxbGlpR05hOXNaTnVNT09uTEF1UUlld25N?=
 =?utf-8?B?UzBBQkE3SWZ6ODZkMW5PdkFXblNhdDk2WWRNRXBRZkFLNWFNL3JuMGhpUzF5?=
 =?utf-8?B?MFo5eDdLWUpKNk1Gbmllb3BpN01PK0hEdVBLUzkwVVMrQ25yRVNWcVN6LzJJ?=
 =?utf-8?B?dEZaUU9waVBwdFJOV2dhcWJQck9GZVdaWlJ2Rys5NGtLVVhsd1JwMTNwQ2lM?=
 =?utf-8?B?eWxQTW1Ka29RQW5XWTV2NXN6cFZKV3lWUlJkWDJkRUhObVF2TlV3UHQzNm5I?=
 =?utf-8?B?aUJIRU5UYk9QbHlsRjYrRTVEN1VaczFRa0lKVnVONEpRbDBlUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95ab2c26-b2f9-4bf0-ce38-08db666e9af6
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 09:15:43.7191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A/wR9kxavpL6p9/NdiBH28r6NgTUXo1biskNZHCNIIAYKBs2MyFyyhWT3ezY6MOC++Lg7+8vNd3vDJd9ii54LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7394
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mailman-Approved-At: Wed, 07 Jun 2023 06:48:52 +0000
Subject: Re: [dm-devel] [PATCH v2 16/16] xen-blkback: Inform userspace that
 device has been opened
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
Cc: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@kernel.org>,
 Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, dm-devel@redhat.com,
 xen-devel@lists.xenproject.org, Alasdair Kergon <agk@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: citrix.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, May 30, 2023 at 04:31:16PM -0400, Demi Marie Obenour wrote:
> Set "opened" to "0" before the hotplug script is called.  Once the
> device node has been opened, set "opened" to "1".
> 
> "opened" is used exclusively by userspace.  It serves two purposes:
> 
> 1. It tells userspace that the diskseq Xenstore entry is supported.
> 
> 2. It tells userspace that it can wait for "opened" to be set to 1.
>    Once "opened" is 1, blkback has a reference to the device, so
>    userspace doesn't need to keep one.
> 
> Together, these changes allow userspace to use block devices with
> delete-on-close behavior, such as loop devices with the autoclear flag
> set or device-mapper devices with the deferred-remove flag set.

There was some work in the past to allow reloading blkback as a
module, it's clear that using delete-on-close won't work if attempting
to reload blkback.

Isn't there some existing way to check whether a device is opened?
(stat syscall maybe?).

I would like to avoid adding more xenstore blkback state if such
information can be fetched from other methods.

> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> ---
>  drivers/block/xen-blkback/xenbus.c | 35 ++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-blkback/xenbus.c
> index 9c3eb148fbd802c74e626c3d7bcd69dcb09bd921..519a78aa9073d1faa1dce5c1b36e95ae58da534b 100644
> --- a/drivers/block/xen-blkback/xenbus.c
> +++ b/drivers/block/xen-blkback/xenbus.c
> @@ -3,6 +3,20 @@
>      Copyright (C) 2005 Rusty Russell <rusty@rustcorp.com.au>
>      Copyright (C) 2005 XenSource Ltd
>  
> +In addition to the Xenstore nodes required by the Xen block device
> +specification, this implementation of blkback uses a new Xenstore
> +node: "opened".  blkback sets "opened" to "0" before the hotplug script
> +is called.  Once the device node has been opened, blkback sets "opened"
> +to "1".
> +
> +"opened" is read exclusively by userspace.  It serves two purposes:
> +
> +1. It tells userspace that diskseq@major:minor syntax for "physical-device" is
> +   supported.
> +
> +2. It tells userspace that it can wait for "opened" to be set to 1 after writing
> +   "physical-device".  Once "opened" is 1, blkback has a reference to the
> +   device, so userspace doesn't need to keep one.
>  
>  */
>  
> @@ -699,6 +713,14 @@ static int xen_blkbk_probe(struct xenbus_device *dev,
>  	if (err)
>  		pr_warn("%s write out 'max-ring-page-order' failed\n", __func__);
>  
> +	/*
> +	 * This informs userspace that the "opened" node will be set to "1" when
> +	 * the device has been opened successfully.
> +	 */
> +	err = xenbus_write(XBT_NIL, dev->nodename, "opened", "0");
> +	if (err)
> +		goto fail;
> +

You would need to set "opened" before registering the xenstore backend
watch AFAICT, or else it could be racy.

Thanks, Roger.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

