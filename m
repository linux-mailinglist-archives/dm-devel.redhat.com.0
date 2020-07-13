Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 636BD21DABF
	for <lists+dm-devel@lfdr.de>; Mon, 13 Jul 2020 17:49:52 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-sF6gEjHdM5KyuSzUKlXf7w-1; Mon, 13 Jul 2020 11:49:49 -0400
X-MC-Unique: sF6gEjHdM5KyuSzUKlXf7w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7EC61081;
	Mon, 13 Jul 2020 15:49:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6507319D7E;
	Mon, 13 Jul 2020 15:49:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4009572F54;
	Mon, 13 Jul 2020 15:49:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06DFnHNd020549 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 13 Jul 2020 11:49:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 524E9EC4A7; Mon, 13 Jul 2020 15:49:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD947E5B1A
	for <dm-devel@redhat.com>; Mon, 13 Jul 2020 15:49:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F55E10B945E
	for <dm-devel@redhat.com>; Mon, 13 Jul 2020 15:49:13 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr50058.outbound.protection.outlook.com [40.107.5.58]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-456-fupyagfJOz2KoCMyKMaIng-1; Mon, 13 Jul 2020 11:49:07 -0400
X-MC-Unique: fupyagfJOz2KoCMyKMaIng-1
Received: from VI1PR04MB4046.eurprd04.prod.outlook.com (2603:10a6:803:4d::29)
	by VI1PR04MB6815.eurprd04.prod.outlook.com (2603:10a6:803:130::10)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20;
	Mon, 13 Jul 2020 15:49:03 +0000
Received: from VI1PR04MB4046.eurprd04.prod.outlook.com
	([fe80::8459:4be8:7034:7a81]) by
	VI1PR04MB4046.eurprd04.prod.outlook.com
	([fe80::8459:4be8:7034:7a81%6]) with mapi id 15.20.3174.025;
	Mon, 13 Jul 2020 15:49:03 +0000
To: Eric Biggers <ebiggers@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>
References: <20200701045217.121126-1-ebiggers@kernel.org>
	<20200701045217.121126-6-ebiggers@kernel.org>
From: =?UTF-8?Q?Horia_Geant=c4=83?= <horia.geanta@nxp.com>
Message-ID: <3f2d3409-2739-b121-0469-b14c86110b2d@nxp.com>
Date: Mon, 13 Jul 2020 18:49:00 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
In-Reply-To: <20200701045217.121126-6-ebiggers@kernel.org>
Content-Language: en-US
X-ClientProxiedBy: AM3PR07CA0145.eurprd07.prod.outlook.com
	(2603:10a6:207:8::31) To VI1PR04MB4046.eurprd04.prod.outlook.com
	(2603:10a6:803:4d::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.129] (84.117.251.185) by
	AM3PR07CA0145.eurprd07.prod.outlook.com (2603:10a6:207:8::31)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.16
	via Frontend Transport; Mon, 13 Jul 2020 15:49:02 +0000
X-Originating-IP: [84.117.251.185]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1060a725-c530-44b1-d17c-08d82744445e
X-MS-TrafficTypeDiagnostic: VI1PR04MB6815:
X-Microsoft-Antispam-PRVS: <VI1PR04MB6815779B0E4B14847BCAB99298600@VI1PR04MB6815.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /bX4p1FrlB0O/Qc+9QRFIwmIHHrutAA6azjO1o81WmvZtaCUnSkTZSB98w/hRe0n9qgWJCSq5ChYtpeK4B5yV/7/PoYsvhGpYQw5615mdMLveyf86a3t3kiwZHag1mJ+5zPBl94oz4kBq7smuOQkaoHwbJGzTchl4462182qXCA+yvabIG84y3IX/jZSY6fbOSPE0128E4bIPoyGuLp4TXegjBlBlgpH+fjnkNu/Au0r2QQXP/q1fc+PlBWCWxHwFUVXsUGtgY7og0sMQL57m9lDoBcPbaKcoM+qPWP4F8clyAhMtANzN+886dlgZZUw7iKciR2qFK9pukP8EuJFu42cfqa9VCxA/nQVESZSyW5SloqEbL/isFnTQ8FgGtcQHSBTKYDtEFjuKWOfEtuDEIBFWz+qqMhypSoFpkQ5QVfBXVR19fMW8y1HEffqDnKPvZ/oLkm7C8cGlEPNLJgN6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:VI1PR04MB4046.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(396003)(136003)(346002)(376002)(39860400002)(366004)(5660300002)(66476007)(66946007)(66556008)(52116002)(53546011)(2906002)(31686004)(36756003)(31696002)(8676002)(86362001)(16526019)(4326008)(966005)(956004)(83380400001)(110136005)(478600001)(26005)(2616005)(16576012)(6486002)(186003)(8936002)(316002)(43740500002);
	DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: sAglqdfsWhn+2W4QOzcYYJigwd9bWnW8FQhgH6RABmWwgMMoeNpZMhurrelUNH6+jqwDJR5FuyCcrMmkb+z8zeK6OevdjDrsbOba4+MmwQC1ag8PCbrewOGp5551PPECTo+oSwizq7rhK8FIQJ/NU4C8qH4pnVa2xXUh8NACQltCi+COH7/wtnDQ973duIutMJGCIwBAm92k8gG6gNvelWClEEAukdlX9ZxH1ZHUjn4s+vAtW7Hg/Oa0f7OkrZqneXqfEa1BWXyz88INKBvdi+sg9XMBisI7REGBXHiQEUmp7dXY0GtttTjWU3g5ofRKoSIn2VTHYcrM4p9ceYm4ooXztXSZFFCDv8DEI9wzXKzTPCbie2C6Xi9CaXBWqP+QXKqFweQwGY2M5hnZADHY4wfMSvKD3cHi6tifikFleyhGL1v0o02lRZUgrN4ZzdmXu8+8PIo2/G36uhaf9xnPY+wAcXxUXU0CYbO8NqB4zhwCRfsaHYkje5w8JaLLVtF7
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1060a725-c530-44b1-d17c-08d82744445e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2020 15:49:03.5266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /K9fl8CNNVGVU2+JhfpS/Yuop/gxJ6DuzbZuiRtz4oot/v814x7L+9Cz2EAsiC5cEoblW1ctS3caoZDkRXD/vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6815
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 5/6] crypto: set the flag
	CRYPTO_ALG_ALLOCATES_MEMORY
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

On 7/1/2020 7:52 AM, Eric Biggers wrote:
> From: Mikulas Patocka <mpatocka@redhat.com>
> 
> Set the flag CRYPTO_ALG_ALLOCATES_MEMORY in the crypto drivers that
> allocate memory.
> 
Quite a few drivers are impacted.

I wonder what's the proper way to address the memory allocation.

Herbert mentioned setting up reqsize:
https://lore.kernel.org/linux-crypto/20200610010450.GA6449@gondor.apana.org.au/

I see at least two hurdles in converting the drivers to using reqsize:

1. Some drivers allocate the memory using GFP_DMA

reqsize does not allow drivers to control gfp allocation flags.

I've tried converting talitos driver (to use reqsize) at some point,
and in the process adding a generic CRYPTO_TFM_REQ_DMA flag:
https://lore.kernel.org/linux-crypto/54FD8D3B.5040409@freescale.com
https://lore.kernel.org/linux-crypto/1426266882-31626-1-git-send-email-horia.geanta@freescale.com

The flag was supposed to be transparent for the user,
however there were users that open-coded the request allocation,
for example esp_alloc_tmp() in net/ipv4/esp4.c.
At that time, Dave NACK-ed the change:
https://lore.kernel.org/linux-crypto/1426266922-31679-1-git-send-email-horia.geanta@freescale.com


2. Memory requirements cannot be determined / are not known
at request allocation time

An analysis for talitos driver is here:
https://lore.kernel.org/linux-crypto/54F8235B.5080301@freescale.com

In general, drivers would be forced to ask more memory than needed,
to handle the "worst-case".
Logic will be needed to fail in case the "worst-case" isn't correctly estimated.

However, this is still problematic.

For example, a driver could set up reqsize to accommodate for 32 S/G entries
(in the HW S/G table). In case a dm-crypt encryption request would require more,
then driver's .encrypt callback would fail, possibly with -ENOMEM,
since there's not enough pre-allocated memory.
This brings us back to the same problem we're trying to solve,
since in this case the driver would be forced to either fail immediately or
to allocate memory at .encrypt/.decrypt time.

Thanks,
Horia

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

