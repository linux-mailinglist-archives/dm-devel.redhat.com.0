Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id C47191659D4
	for <lists+dm-devel@lfdr.de>; Thu, 20 Feb 2020 10:06:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582189610;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jhcqZaGS8k/j9AsjfoiisoVidaQoCRd8SKcg11FAc/E=;
	b=SkVOv1d3lCPD9UgYWxeN83+BodalmP75o3yU2WbxkxoPd9CWKT2tG4NbG1FLmZO4XabIFI
	nANCaWC+9HW7nin/Ei/OND5T7FVeyX1PkAWfTQms//6JG7++6iEkfw562lDCcSWHv+ANRx
	YdjarnZL2KYBgevUQi7nUpSBiPpxlus=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-NWPNmtQEO5us1vGwfI-hVw-1; Thu, 20 Feb 2020 04:06:47 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A161B8010F6;
	Thu, 20 Feb 2020 09:06:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D3151001925;
	Thu, 20 Feb 2020 09:06:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E906D81759;
	Thu, 20 Feb 2020 09:06:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01DK8UMe031208 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 13 Feb 2020 15:08:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3FE16F4D21; Thu, 13 Feb 2020 20:08:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3ABC1120EBD
	for <dm-devel@redhat.com>; Thu, 13 Feb 2020 20:08:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8CE62867B07
	for <dm-devel@redhat.com>; Thu, 13 Feb 2020 20:08:27 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
	(mail-eopbgr80125.outbound.protection.outlook.com [40.107.8.125])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-273-mjk9g9oRNYqJu10cr4q93g-1; Thu, 13 Feb 2020 15:08:22 -0500
Received: from DB7PR08MB3276.eurprd08.prod.outlook.com (52.135.128.26) by
	DB7PR08MB3387.eurprd08.prod.outlook.com (20.176.239.94) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2707.21; Thu, 13 Feb 2020 20:08:18 +0000
Received: from DB7PR08MB3276.eurprd08.prod.outlook.com
	([fe80::304f:d257:baf1:4d22]) by
	DB7PR08MB3276.eurprd08.prod.outlook.com
	([fe80::304f:d257:baf1:4d22%4]) with mapi id 15.20.2707.030;
	Thu, 13 Feb 2020 20:08:18 +0000
To: "Darrick J. Wong" <darrick.wong@oracle.com>
References: <158157930219.111879.12072477040351921368.stgit@localhost.localdomain>
	<158157957565.111879.5952051034259419400.stgit@localhost.localdomain>
	<20200213181141.GT6874@magnolia>
From: Kirill Tkhai <ktkhai@virtuozzo.com>
Message-ID: <6e3081f5-9462-c6e8-2ab9-524dc3d0304c@virtuozzo.com>
Date: Thu, 13 Feb 2020 23:07:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
In-Reply-To: <20200213181141.GT6874@magnolia>
Content-Language: en-US
X-ClientProxiedBy: HE1P190CA0023.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:bc::33)
	To DB7PR08MB3276.eurprd08.prod.outlook.com
	(2603:10a6:5:21::26)
MIME-Version: 1.0
Received: from localhost.localdomain (176.14.212.145) by
	HE1P190CA0023.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:bc::33)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.25
	via Frontend Transport; Thu, 13 Feb 2020 20:08:14 +0000
X-Originating-IP: [176.14.212.145]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d129ce7-93fd-4650-f0ff-08d7b0c0776e
X-MS-TrafficTypeDiagnostic: DB7PR08MB3387:
X-Microsoft-Antispam-PRVS: <DB7PR08MB338766E746A15D8B55E708DFCD1A0@DB7PR08MB3387.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-Forefront-PRVS: 031257FE13
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(376002)(346002)(39830400003)(366004)(136003)(396003)(189003)(199004)(8936002)(81166006)(6506007)(2906002)(6916009)(16526019)(8676002)(186003)(53546011)(6486002)(26005)(52116002)(81156014)(36756003)(6512007)(956004)(66556008)(478600001)(7416002)(66476007)(66946007)(316002)(4326008)(2616005)(31696002)(5660300002)(31686004)(86362001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB7PR08MB3387;
	H:DB7PR08MB3276.eurprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DwJFGDxyl0MyXmNz/0g+szVR7l9zY+wC7mCRvFb+DAyASo7Pu80DWqhsY0sx3zrCnD5bDd17pT2gAkTuqCOu+JibDy0HBtJr62Vhmys9VkfFxMLqPZDMrrWCE25NmdQrdOMmWjhViGAA9PqD2WJqfNau9R/RTfgMJzyMBNuvXSX2awDymdanI7P1ErqhEiEYNOR9aiWqIQnQQloWAmi/H4+mmWt0TQVxykMRnvcg5skprlJWGdMdHBk+YdCs4DxU/mI3/Kd4tC0W0+vCROO+oqd11xIdeDh7lwo9YT5CK/7YxVIIt04Iu/DwAfHDxJg/MZlN89R3OAuB7Vv/Bq2RNAMhCYQc/Vuah1VCU9VFBQk/gjwlmianCr58fVBjvaVA58NfDjMCqOm2UTW3qJCvIvo/CG9ESJ8XAM9R3Lrrthk46AF7QLZIu6KAuUz/QnVn
X-MS-Exchange-AntiSpam-MessageData: 3u6WJWy96Drpuv4VqHVDRjeDzQ1/qNcGDiW4FZxOmRbaxlJ1pvFSyZKzZP36ufkrqMeZ4cUUJy3dNAWrP/nLWF2O0OzIvomD3UYmHfMzfDX1P9HyhydZ1OZi1dsJPJo/yXQC12POe36/id5TmqhrBg==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d129ce7-93fd-4650-f0ff-08d7b0c0776e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2020 20:08:18.3321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AB3oqubc00LDjbpHNNx7TapAZfZT+4mfQGE02hvLXfMhBCC2vySSleJp4llmclXWa/9+5HCb8/DgQ6q6ct06eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3387
X-MC-Unique: mjk9g9oRNYqJu10cr4q93g-1
X-MC-Unique: NWPNmtQEO5us1vGwfI-hVw-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01DK8UMe031208
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 20 Feb 2020 04:05:51 -0500
Cc: andrea.parri@amarulasolutions.com, snitzer@redhat.com, dhowells@redhat.com,
	song@kernel.org, dm-devel@redhat.com, adilger.kernel@dilger.ca,
	osandov@fb.com, agk@redhat.com, hare@suse.com,
	bvanassche@acm.org, bob.liu@oracle.com, minwoo.im.dev@gmail.com,
	jthumshirn@suse.de, ajay.joshi@wdc.com,
	Chaitanya.Kulkarni@wdc.com, ming.lei@redhat.com,
	linux-block@vger.kernel.org, dsterba@suse.com, sagi@grimberg.me,
	axboe@kernel.dk, damien.lemoal@wdc.com, tytso@mit.edu,
	martin.petersen@oracle.com, linux-kernel@vger.kernel.org,
	tj@kernel.org, asml.silence@gmail.com
Subject: Re: [dm-devel] [PATCH v7 6/6] loop: Add support for REQ_ALLOCATE
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 13.02.2020 21:11, Darrick J. Wong wrote:
> On Thu, Feb 13, 2020 at 10:39:35AM +0300, Kirill Tkhai wrote:
>> Support for new modifier of REQ_OP_WRITE_ZEROES command.
>> This results in allocation extents in backing file instead
>> of actual blocks zeroing.
>>
>> Signed-off-by: Kirill Tkhai <ktkhai@virtuozzo.com>
>> Reviewed-by: Bob Liu <bob.liu@oracle.com>
>> Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>
>> ---
>>  drivers/block/loop.c |   20 +++++++++++++-------
>>  1 file changed, 13 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/block/loop.c b/drivers/block/loop.c
>> index 739b372a5112..0704167a5aaa 100644
>> --- a/drivers/block/loop.c
>> +++ b/drivers/block/loop.c
>> @@ -581,6 +581,16 @@ static int lo_rw_aio(struct loop_device *lo, struct loop_cmd *cmd,
>>  	return 0;
>>  }
>>  
> 
> Urgh, I meant "copy the comment directly to here", e.g.
> 
> /*
>  * Convert REQ_OP_WRITE_ZEROES modifiers into fallocate mode
>  *
>  * If the caller requires allocation, select that mode.  If the caller
>  * doesn't want deallocation, call zeroout to write zeroes the range.
>  * Otherwise, punch out the blocks.
>  */
> 
> The goal here is to reinforce the notion that FL_ZERO_RANGE is how we
> achieve nounmap zeroing...

The function is pretty small, and its meaning is easily seen from the name
and description.

I don't think we have to retell every function code line in a separate
sentence, since this distract the attention from really difficult places,
which are really need it.

Kirill


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

