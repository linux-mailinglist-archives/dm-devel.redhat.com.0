Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 4F4E9223E7D
	for <lists+dm-devel@lfdr.de>; Fri, 17 Jul 2020 16:44:37 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-206kG-GdP7Sk93Sr5Lk9Gg-1; Fri, 17 Jul 2020 10:44:33 -0400
X-MC-Unique: 206kG-GdP7Sk93Sr5Lk9Gg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 158C2100A614;
	Fri, 17 Jul 2020 14:44:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D785E61100;
	Fri, 17 Jul 2020 14:44:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 85FD41809557;
	Fri, 17 Jul 2020 14:44:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06HEgu7Y004547 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 17 Jul 2020 10:42:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CA1822166BA2; Fri, 17 Jul 2020 14:42:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C535B2166BA3
	for <dm-devel@redhat.com>; Fri, 17 Jul 2020 14:42:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CEF7D800399
	for <dm-devel@redhat.com>; Fri, 17 Jul 2020 14:42:53 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
	(mail-vi1eur05on2078.outbound.protection.outlook.com [40.107.21.78])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-144-rHgyOVi4OUKkhZUnozKZ8g-1; Fri, 17 Jul 2020 10:42:50 -0400
X-MC-Unique: rHgyOVi4OUKkhZUnozKZ8g-1
Received: from VI1PR04MB4046.eurprd04.prod.outlook.com (2603:10a6:803:4d::29)
	by VI1PR0402MB3582.eurprd04.prod.outlook.com (2603:10a6:803:9::27)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21;
	Fri, 17 Jul 2020 14:42:46 +0000
Received: from VI1PR04MB4046.eurprd04.prod.outlook.com
	([fe80::8459:4be8:7034:7a81]) by
	VI1PR04MB4046.eurprd04.prod.outlook.com
	([fe80::8459:4be8:7034:7a81%6]) with mapi id 15.20.3195.022;
	Fri, 17 Jul 2020 14:42:46 +0000
To: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@kernel.org>
References: <20200716115538.GA31461@gondor.apana.org.au>
From: =?UTF-8?Q?Horia_Geant=c4=83?= <horia.geanta@nxp.com>
Message-ID: <8eefed8b-5ad5-424b-ab32-85e0cbac0a15@nxp.com>
Date: Fri, 17 Jul 2020 17:42:43 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
In-Reply-To: <20200716115538.GA31461@gondor.apana.org.au>
Content-Language: en-US
X-ClientProxiedBy: AM0PR04CA0061.eurprd04.prod.outlook.com
	(2603:10a6:208:1::38) To VI1PR04MB4046.eurprd04.prod.outlook.com
	(2603:10a6:803:4d::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.129] (84.117.251.185) by
	AM0PR04CA0061.eurprd04.prod.outlook.com (2603:10a6:208:1::38)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17
	via Frontend Transport; Fri, 17 Jul 2020 14:42:45 +0000
X-Originating-IP: [84.117.251.185]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 505fad1d-9af5-4a9b-be8d-08d82a5fab9f
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3582:
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3582747CC59C6B97A095B789987C0@VI1PR0402MB3582.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zaki4aM9bcGgxbj3Vx4e8V+JnYxvO80CD/l29WBTOzEhLdTBM98hUIsqJHcrwLysehUtkY+H2G3rwFBBHlx+HTpzYpO0KJwiXGRpcm+OFeHIPFQpMhmqFhdAifYSKh0o/ozjNZt4dzeFp0WUwCR5+pfXVnyzeXNqc94ZjZgzMXVp9gsUFg8d8sKA73LzcIvwoWlfhSym2eitbAMge5ZwC+2LJfmlGOTrGs8G3Z9AiLh9HnkE8Im+FQmPwA1fnRmXKFfcWq2M+eVbajcLai6ttla5/6so8Ad0FfI9BZvcMk/EIc2yWJVvIMpnUCwf5NOVwy7y4YjKGdvse8wOkUJdIsaxANv44KPmjZEgC8dEoXstUKauuc5MH3htBxSLSHDjPpZphwkXVfE06hzmtAmrit0cHddfTmDLDXcemamHkcTi6ajwsufpvu8bBDMCgeYl5d70xcAbmCQzpAfr93Bujg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:VI1PR04MB4046.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(39860400002)(136003)(376002)(396003)(366004)(346002)(26005)(66556008)(66476007)(66946007)(36756003)(966005)(16526019)(8936002)(110136005)(16576012)(8676002)(956004)(4326008)(2616005)(316002)(186003)(31696002)(478600001)(83380400001)(31686004)(5660300002)(52116002)(6486002)(53546011)(2906002)(86362001)(43740500002);
	DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: qDwx7Xox8gdmOOognSq1D3v6NSLjxzr0HJr2qKwtkhzcbxpHzxZJOV9+FQptKuyn5hIIBkkDPiV//QSiuoA00t+JFXbsvVWr9URiejXZBfOuAFFOLe86nlARpaqWp6Dng9l54zdXXVjyM8Zr8rJKlrHgAyZUNQ1EN3U5R3awZFg2VoIHfieq+7kWKAjLYcRktDLV+f96Bqr/QqK9iYPC6QSUwEtnSX5sN6TBN963vfGjxe5mb3ASCc74YEkgGHmTwtm1koLz1rewFNoxLFqOWGPrjrmD38qCMANHqyNL92SMtFkHUdAh1oBhQtp75DRrSvbaZEhTDv3t1K3vuhsR4CnYZo1Mp00JhrA72240A7VEIUy0j0Mm6H+nep6lPKzRHnPxzHec+PCy+XdDb6UYsOHh54rhGF/ZQ146+ytLuvpERAQNiAGwlRNB1xxSszDY0kXOBuC5NTXeEaC2NLcpkzwz+cY46krwbEdeEW7SjEbVAvBFBVMYVxX4r4GawSPh
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 505fad1d-9af5-4a9b-be8d-08d82a5fab9f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2020 14:42:46.7165 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j+KL9xIW/ONcHpV7rd8AEJefZdNOqtzZhFj8+wca6h29cB5u/CvMOabThMAjWwMT86+lrHsfts7XGwVxH/lWPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3582
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, mpatocka@redhat.com, linux-crypto@vger.kernel.org
Subject: Re: [dm-devel] [PATCH v2 0/7] crypto: add
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 7/16/2020 2:55 PM, Herbert Xu wrote:
> Eric Biggers <ebiggers@kernel.org> wrote:
>> This series introduces a flag that algorithms can set to indicate that
>> they allocate memory during processing of typical inputs, and thus
>> shouldn't be used in cases like dm-crypt where memory allocation
>> failures aren't acceptable.
>>
>> Compared to Mikulas's patches, I've made the following improvements:
>>
>> - Tried to clearly document the semantics of
>>  CRYPTO_ALG_ALLOCATES_MEMORY.  This includes documenting the usage
>>  constraints, since there are actually lots of cases that were
>>  overlooked where algorithms can still allocate memory in some edge
>>  cases where inputs are misaligned, fragemented, etc.  E.g. see
>>  crypto/skcipher.c and crypto/ahash.c.  Mikulas, please let me know if
>>  there are any concerns for dm-crypt.
>>
>> - Moved the common mechanism for inheriting flags to its own patch.
>>
>> - crypto_grab_spawn() now handles propagating CRYPTO_ALG_INHERITED_FLAGS
>>  to the new template instance.
>>
>> - Inherit the flags in various places that were missed.
>>
>> - Other cleanups.
>>
>> Additional changes v1 => v2:
>>
>> - Made crypto_check_attr_type() return the mask.
>>
>> - Added patch that adds NEED_FALLBACK to INHERITED_FLAGS.
>>
>> - Added patch that removes seqiv_create().
>>
>> Eric Biggers (5):
>>  crypto: geniv - remove unneeded arguments from aead_geniv_alloc()
>>  crypto: seqiv - remove seqiv_create()
>>  crypto: algapi - use common mechanism for inheriting flags
>>  crypto: algapi - add NEED_FALLBACK to INHERITED_FLAGS
>>  crypto: algapi - introduce the flag CRYPTO_ALG_ALLOCATES_MEMORY
>>
>> Mikulas Patocka (2):
>>  crypto: drivers - set the flag CRYPTO_ALG_ALLOCATES_MEMORY
>>  dm-crypt: don't use drivers that have CRYPTO_ALG_ALLOCATES_MEMORY
>>
>> crypto/adiantum.c                             |  14 +--
>> crypto/algapi.c                               |  21 +++-
>> crypto/authenc.c                              |  14 +--
>> crypto/authencesn.c                           |  14 +--
>> crypto/ccm.c                                  |  33 ++---
>> crypto/chacha20poly1305.c                     |  14 +--
>> crypto/cmac.c                                 |   5 +-
>> crypto/cryptd.c                               |  59 ++++-----
>> crypto/ctr.c                                  |  17 +--
>> crypto/cts.c                                  |  13 +-
>> crypto/echainiv.c                             |   2 +-
>> crypto/essiv.c                                |  11 +-
>> crypto/gcm.c                                  |  40 ++----
>> crypto/geniv.c                                |  19 +--
>> crypto/hmac.c                                 |   5 +-
>> crypto/lrw.c                                  |  13 +-
>> crypto/pcrypt.c                               |  14 +--
>> crypto/rsa-pkcs1pad.c                         |  13 +-
>> crypto/seqiv.c                                |  18 +--
>> crypto/simd.c                                 |   6 +-
>> crypto/skcipher.c                             |  13 +-
>> crypto/vmac.c                                 |   5 +-
>> crypto/xcbc.c                                 |   5 +-
>> crypto/xts.c                                  |  15 +--
>> .../crypto/allwinner/sun8i-ce/sun8i-ce-core.c |  12 +-
>> .../crypto/allwinner/sun8i-ss/sun8i-ss-core.c |  12 +-
>> drivers/crypto/amlogic/amlogic-gxl-core.c     |   6 +-
>> drivers/crypto/axis/artpec6_crypto.c          |  20 ++-
>> drivers/crypto/bcm/cipher.c                   |  72 ++++++++---
>> drivers/crypto/caam/caamalg.c                 |   6 +-
>> drivers/crypto/caam/caamalg_qi.c              |   6 +-
>> drivers/crypto/caam/caamalg_qi2.c             |   8 +-
>> drivers/crypto/caam/caamhash.c                |   2 +-
>> drivers/crypto/cavium/cpt/cptvf_algs.c        |  18 ++-
>> drivers/crypto/cavium/nitrox/nitrox_aead.c    |   4 +-
>> .../crypto/cavium/nitrox/nitrox_skcipher.c    |  16 +--
>> drivers/crypto/ccp/ccp-crypto-aes-cmac.c      |   1 +
>> drivers/crypto/ccp/ccp-crypto-aes-galois.c    |   1 +
>> drivers/crypto/ccp/ccp-crypto-aes-xts.c       |   1 +
>> drivers/crypto/ccp/ccp-crypto-aes.c           |   2 +
>> drivers/crypto/ccp/ccp-crypto-des3.c          |   1 +
>> drivers/crypto/ccp/ccp-crypto-sha.c           |   1 +
>> drivers/crypto/chelsio/chcr_algo.c            |   7 +-
>> drivers/crypto/hisilicon/sec/sec_algs.c       |  24 ++--
>> drivers/crypto/hisilicon/sec2/sec_crypto.c    |   4 +-
>> .../crypto/inside-secure/safexcel_cipher.c    |  47 +++++++
>> drivers/crypto/inside-secure/safexcel_hash.c  |  18 +++
>> drivers/crypto/ixp4xx_crypto.c                |   6 +-
>> drivers/crypto/marvell/cesa/cipher.c          |  18 ++-
>> drivers/crypto/marvell/cesa/hash.c            |   6 +
>> .../crypto/marvell/octeontx/otx_cptvf_algs.c  |  30 ++---
>> drivers/crypto/n2_core.c                      |   3 +-
>> drivers/crypto/picoxcell_crypto.c             |  17 ++-
>> drivers/crypto/qat/qat_common/qat_algs.c      |  13 +-
>> drivers/crypto/qce/skcipher.c                 |   1 +
>> drivers/crypto/talitos.c                      | 117 ++++++++++++------
>> drivers/crypto/virtio/virtio_crypto_algs.c    |   3 +-
>> drivers/crypto/xilinx/zynqmp-aes-gcm.c        |   1 +
>> drivers/md/dm-crypt.c                         |  17 ++-
>> include/crypto/algapi.h                       |  25 ++--
>> include/crypto/internal/geniv.h               |   2 +-
>> include/linux/crypto.h                        |  36 +++++-
>> 62 files changed, 562 insertions(+), 405 deletions(-)
> 
> Patches 1-6 applied.  Thanks.
> 
Looks like there's no mention of a limit on src, dst scatterlists size
that crypto implementations could use when pre-allocating memory
and crypto users needing CRYPTO_ALG_ALLOCATES_MEMORY should be aware of
(for the contract to be honoured):
https://lore.kernel.org/linux-crypto/780cb500-2241-61bc-eb44-6f872ad567d3@nxp.com

Another thing I would like to clarify, if possible.

Before forcing all crypto drivers to pre-allocate memory,
shouldn't alternatives have been investigated?

The discussion below mentions one, which IIUC was not explored / discussed.
https://lore.kernel.org/linux-crypto/alpine.LRH.2.02.2006100756270.27811@file01.intranet.prod.int.rdu2.redhat.com

Another possibility - I was thinking about setting 
CRYPTO_TFM_REQ_MAY_SLEEP in dm-crypt and calling the crypto function under 
memalloc_noio_save. But there are some drivers that do GFP_ATOMIC 
allocation regardless of CRYPTO_TFM_REQ_MAY_SLEEP.

Thanks,
Horia

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

