Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC144B80AA
	for <lists+dm-devel@lfdr.de>; Wed, 16 Feb 2022 07:30:05 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-59-yD-hUhUBOAW7NlWGGqeBfg-1; Wed, 16 Feb 2022 01:29:17 -0500
X-MC-Unique: yD-hUhUBOAW7NlWGGqeBfg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8583814243;
	Wed, 16 Feb 2022 06:29:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A19B5DBBF;
	Wed, 16 Feb 2022 06:29:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 442BE4A70B;
	Wed, 16 Feb 2022 06:29:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
	[10.11.54.9])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21FIc9ul028646 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 15 Feb 2022 13:38:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3751D492D1F; Tue, 15 Feb 2022 18:38:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 32972492D1C
	for <dm-devel@redhat.com>; Tue, 15 Feb 2022 18:38:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1566D811E9B
	for <dm-devel@redhat.com>; Tue, 15 Feb 2022 18:38:09 +0000 (UTC)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
	[205.220.177.32]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-541-Ljwc5wOtPaihnFMvpK4jpg-3; Tue, 15 Feb 2022 13:38:05 -0500
X-MC-Unique: Ljwc5wOtPaihnFMvpK4jpg-3
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id
	21FGT2h8018456; Tue, 15 Feb 2022 16:31:48 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by mx0b-00069f02.pphosted.com with ESMTP id 3e871pspet-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Feb 2022 16:31:48 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21FGVEUm061656;
	Tue, 15 Feb 2022 16:31:47 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
	(mail-bn1nam07lp2049.outbound.protection.outlook.com [104.47.51.49])
	by userp3030.oracle.com with ESMTP id 3e620xc1r3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Feb 2022 16:31:47 +0000
Received: from DM5PR10MB1466.namprd10.prod.outlook.com (2603:10b6:3:b::7) by
	MWHPR10MB1885.namprd10.prod.outlook.com (2603:10b6:300:10a::17) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.14;
	Tue, 15 Feb 2022 16:31:44 +0000
Received: from DM5PR10MB1466.namprd10.prod.outlook.com
	([fe80::3448:8685:9668:b4d5]) by
	DM5PR10MB1466.namprd10.prod.outlook.com
	([fe80::3448:8685:9668:b4d5%5]) with mapi id 15.20.4975.019;
	Tue, 15 Feb 2022 16:31:44 +0000
Message-ID: <828ac69a-fe28-0869-bc1f-7fd106dff0aa@oracle.com>
Date: Tue, 15 Feb 2022 10:31:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.6.0
To: Zhengyuan Liu <liuzhengyuang521@gmail.com>, linux-scsi@vger.kernel.org,
	open-iscsi <open-iscsi@googlegroups.com>, dm-devel@redhat.com
References: <CAOOPZo4uNCicVmoHa2za0=O1_XiBdtBvTuUzqBTeBc3FmDqEJw@mail.gmail.com>
From: Mike Christie <michael.christie@oracle.com>
In-Reply-To: <CAOOPZo4uNCicVmoHa2za0=O1_XiBdtBvTuUzqBTeBc3FmDqEJw@mail.gmail.com>
X-ClientProxiedBy: DM5PR06CA0025.namprd06.prod.outlook.com
	(2603:10b6:3:5d::11) To DM5PR10MB1466.namprd10.prod.outlook.com
	(2603:10b6:3:b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: daed94bc-6ca0-4ffd-b10b-08d9f0a0a708
X-MS-TrafficTypeDiagnostic: MWHPR10MB1885:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB1885127590A280541C604005F1349@MWHPR10MB1885.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: EEgWuaiwVITEOywbXpKBSy9B1ghvVY++zvplbqRLc1toKaAwZL56AJ4p3smaPVcH09EZRq4pXaH4Gi26VrQOlaBMr11rrT6ATwvfNmuokhHJwtCyyKLjK4m/FvLu59wrrXN57JIXkUsaqpcRUBc0UcJ3MkJiSOx4EawWG88t8MkxEYr8C4zzKuGbdJnlUFrT3ReOjEgaOrzhGSjsWwOAvv7DtW63SOYnMbhCoj0qxqdHwI5dIE4G3GoaMUL7UrP4A6KgeMbu10A0eoUfCFRYrH405GCRLNc4itFbk6CNvdzEsCfWUXmsh1DQLnBXDMEPvF81n07yphReSYK6sKSMHeZ9ETJSSMvnxuhcj2r1yfbKA+tNga2TP8q1AOvQUoDM0/0nBSFGkhQuBfZ4T/gbgU0hbCftZyw3npUUkXTY2XK9KRrCWHU0tYkvHipzGa53O5ZFkFniHBmlNWou0kek3Y6GyhYv2tO0Niy1DPxGweFyun0bYjTqm1CM904hw2oLky2nAKnpJyGVwd7ezLv8+h26DXBzsChvgnLiOCJaa5uS46a2M82+JKMF6BYlDTdexch7ZkEJTc6wC0D3lQYmXI4kk3daFqBu//6XWSEKQBWLnRfWG/xYFqSi6RDtbonj5od16kZD+gbnl/PpuUelBQO3fD8ahA9FZikdm0sIoVKz0Rqsyo86fFEw85TG55MurQTRZHqeUDMipR3psot5a6eshOu7WXvLMviI/4WLgNE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DM5PR10MB1466.namprd10.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(13230001)(366004)(53546011)(38100700002)(31686004)(186003)(2616005)(26005)(6506007)(508600001)(6512007)(31696002)(6486002)(86362001)(2906002)(5660300002)(36756003)(83380400001)(110136005)(66556008)(4326008)(8676002)(8936002)(66476007)(316002)(66946007)(43740500002)(45980500001);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TklvZXRrckdTNzV3ak1IVkUyT252Q2pqQk45R0MyczV0ajNRbGdsWTQwUU1a?=
	=?utf-8?B?MXlQSkpvQ2c0MkZZUFRKWW9NV0h2Y3BCdFNtTm1RYVdBaVUyR0hUTTVsc0pW?=
	=?utf-8?B?aFlmRUpNNmlqTGo0aHlVQUdOclJZRmNhaEh3NmJUQkQrbk5OYlYzQkpyT0lv?=
	=?utf-8?B?bTIxaHJLL3o5ajBuMFEyMW9UaldmaURibTB4Qkd4NUpMQm5NN01KbnUzMDRX?=
	=?utf-8?B?VUFBcktQSFZUYWtrTXdHYkNhZkN4SitKNkExN2NKRFp1aWxvenZTeWhiL24y?=
	=?utf-8?B?SDVFSGpubnFoU1dIb2s3d3k1eUlXLzdPZTVncGFncFIydXJ3OVVtSDVPRHoz?=
	=?utf-8?B?aUFSWGt3ZlZMcHJiTlplUjZqZUVxR1QwU2U4MUh6WEVwbFRRT1JtOTNJL0lY?=
	=?utf-8?B?d0YzekZrOEtScVhKeVN1RVBXb2ExOTZWcjRWQjRhSGY4bUJ3eU43L1dUVy9u?=
	=?utf-8?B?Uk9OU0hQUFdvanZqNVJHYnUyVFBYdDVkUWtmRytXamE5RlhGYjVyNFRFZk9m?=
	=?utf-8?B?bVlQWEFQWVE3NVE2NHcxeTZKR1BaOVFQazk0QXMzUlB4M3ZSdGUraDdQN3J5?=
	=?utf-8?B?Q1ZQSUovdGFsMHYrMTAxSi9Rd1QyTFNyRmN6UmZQSHdpVVZlT0tNSE9IU014?=
	=?utf-8?B?ZitTcWkxZ3A3OXBEVFRpQkJ5N2hnaEFDVnZIditsRlR4TXg5dE1MRkExaHJp?=
	=?utf-8?B?N1ZLOXp6OVFGRW52dEkxcHp5d2l0M2JNdE1sOVpBalphbE1BakM5UTRQOEZa?=
	=?utf-8?B?NDdTSGs1Y3BxQnU0RDdQbUtQd2ZYRDJJaU5lNFZUZzgyNnNoaGQ1NDZiS1Mx?=
	=?utf-8?B?ZDZ2QVlVM1RjNDl5cXh2WGs4M2JDNmlWMWtKczM1aDFDMWJiVFR2MU94aUIz?=
	=?utf-8?B?YjdXSVdydk1zT1hZSGFlV25qeHpVc1V5VXROSmthbllqRTI4N2Z0UGNnTHRu?=
	=?utf-8?B?dTd6SEpJNmViMlBUb3NGYlF3RVpKRmpIajY1MzhkV0xZQXlZaTFaTHlxRHR1?=
	=?utf-8?B?ZUdOaE5uS202aW9TcUF1V0hFdkg0TklwM3cxdG1JbmNodHoyZmJ3QWRRalZy?=
	=?utf-8?B?NWJJdVR3bi85YjJxM3lOOVBVKys0UERXZVl6UDlQRkFodGtRTEZ4TnJkbVlh?=
	=?utf-8?B?dDUyZXNTbU9ud3pJTStPSFhGTHJGV1pyR2kvMnlLeGVTUWEzWVhoRnVVemxQ?=
	=?utf-8?B?NGRjTS9NSGV6bFozaDVrRUdhc2Fpc2ZKa0FOUkVPeTNQZmhuMnZxUytXYUdZ?=
	=?utf-8?B?UjcwUXVIMVBGQmEyMk1hb3lpaDVFM2h5cVdmTncvVnJVZDdORitEQmk4elVB?=
	=?utf-8?B?UDVUc0p5UGp2OXgvckFaQVNrTUxJd3pqRWFSME1ZTXNsTDZuZElZU2lLVE8v?=
	=?utf-8?B?clhlUUNTQ2tmU3k4bEtLSEpIUDIzNnlmejcxUVV0UnpHdnRHcCtwdVFmQzZE?=
	=?utf-8?B?Z0V3T1ZRcE9lVkxGbDBiRWd4OVNnaDhNeW1qTVlCMjJMOEJzMHQrMGdEK3Rj?=
	=?utf-8?B?SlR6VkVQSldZZVBnRGdwMmdTZk9hcHRoN3lycVFaWmV3b3Y3MmxVYmpPNWNl?=
	=?utf-8?B?QTE5Mm04M1FiZ2RibXR0K0p0MDVRbmZ0VlpSaEc0NDVUQUVaNDl5RjlzOVov?=
	=?utf-8?B?SVR3bGhudjhxQWpzT0F5NktWaW5TSWVWRWdaRUlDRjR1TEo3ZmdvcTQxTnp0?=
	=?utf-8?B?bTRjWDcvZ01MelNtOU8zalRkVzgyaTZ1cW1hclF5ZDBEU1ZzY3NFbnZZUkJM?=
	=?utf-8?B?d1UveCsvWi9qa042ejlHQzRDQldkaktlZTEwUWZVaC8wT0JWM2xZcE5tTHRo?=
	=?utf-8?B?ckk0dlN4cWRwV0dBd3hhMWE5cVpDR2dwZTFVQ1YvY25sZnhud0NGOGV0YmRQ?=
	=?utf-8?B?a2pnYnVCc3dBTmhRdGZ4Ry9odEoyTi95NXB3djNmb1pWOUNhRkJMbmR5ME9F?=
	=?utf-8?B?SzI0c0tySnFoQnU5NE5GT2w0U0lJQkY1SVpPTmJua2F1ZkpyNHJxZHpEUkFn?=
	=?utf-8?B?RUNybmg3UmtWOXQxeHpUZVJDbjJIUFRYSDhwQ0NaUit4cm5JSFFkeDNPOHlY?=
	=?utf-8?B?dmxTRkpDbExoM1RvMWk0U0VHamkyK0NLLzRLL1FOR1RyN2hTUVJFTjNFY2RP?=
	=?utf-8?B?N2MvVmFTTVBxS2hxNE1HS0gyNWFwRS80RlNWZDVvUS9MMzZMK1RiNTZLYkhi?=
	=?utf-8?B?N210REFoYkV0ZFNIRlFKTUZZVnplVEFzN3hXcm5OdXlKbG81VGREeXRGbkxB?=
	=?utf-8?B?TWs0VmgwQXBZSkY0ejI4L0E2ZFFnPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daed94bc-6ca0-4ffd-b10b-08d9f0a0a708
X-MS-Exchange-CrossTenant-AuthSource: DM5PR10MB1466.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 16:31:44.0090 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hBB8dYwZpjVUeUhPlxBIEV+n1k3LzuxRhTY5NLBXUfQYssFMVAGBoubxTrFdO8l4xO8QxcP2P6RVlF0GXjxXwdIjDv6lGfjrI/G1HyjgHHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1885
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10258
	signatures=673431
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	mlxlogscore=999 bulkscore=0 spamscore=0 adultscore=0 mlxscore=0
	phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2201110000 definitions=main-2202150097
X-Proofpoint-GUID: k7J63dYYS0TvT7QpmWpw3GIQsOToNfEK
X-Proofpoint-ORIG-GUID: k7J63dYYS0TvT7QpmWpw3GIQsOToNfEK
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 16 Feb 2022 01:28:09 -0500
Cc: leech@redhat.com, lduncan@suse.com
Subject: Re: [dm-devel] Question about iscsi session block
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2/15/22 9:49 AM, Zhengyuan Liu wrote:
> Hi, all
> 
> We have an online server which uses multipath + iscsi to attach storage
> from Storage Server. There are two NICs on the server and for each it
> carries about 20 iscsi sessions and for each session it includes about 50
>  iscsi devices (yes, there are totally about 2*20*50=2000 iscsi block devices
>  on the server). The problem is: once a NIC gets faulted, it will take too long
> (nearly 80s) for multipath to switch to another good NIC link, because it
> needs to block all iscsi devices over that faulted NIC firstly. The callstack is
>  shown below:
> 
>     void iscsi_block_session(struct iscsi_cls_session *session)
>     {
>         queue_work(iscsi_eh_timer_workq, &session->block_work);
>     }
> 
>  __iscsi_block_session() -> scsi_target_block() -> target_block() ->
>   device_block() ->  scsi_internal_device_block() -> scsi_stop_queue() ->
>  blk_mq_quiesce_queue()>synchronize_rcu()
> 
> For all sessions and all devices, it was processed sequentially, and we have
> traced that for each synchronize_rcu() call it takes about 80ms, so
> the total cost
> is about 80s (80ms * 20 * 50). It's so long that the application can't
> tolerate and
> may interrupt service.
> 
> So my question is that can we optimize the procedure to reduce the time cost on
> blocking all iscsi devices?  I'm not sure if it is a good idea to increase the
> workqueue's max_active of iscsi_eh_timer_workq to improve concurrency.

We need a patch, so the unblock call waits/cancels/flushes the block call or
they could be running in parallel.

I'll send a patchset later today so you can test it.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

