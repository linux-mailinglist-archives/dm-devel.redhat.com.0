Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 9FB251D2458
	for <lists+dm-devel@lfdr.de>; Thu, 14 May 2020 02:55:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589417740;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=eRYjomC/RuQmSjKMJFTwZn0QEbwdb1f5DhjEhcNT8yw=;
	b=CMb2StbwCucqePOTdD5Ej11Zadly23oZjTlpy9zswrnXJaZtPu6eHMk9TLChruEOpcoo0H
	UyP8dzP8/gSnV3/ghuwLgM/Ws1OvE0fmSwGWEl/qWOarbmdPbV5msh7W+EPNmraCtoEAIp
	DWR0v6jaK6RskIhetMRi1+Zg7VQC39c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-cw6MY0aXPDGn3HTjB9Ls5Q-1; Wed, 13 May 2020 20:55:37 -0400
X-MC-Unique: cw6MY0aXPDGn3HTjB9Ls5Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54D5E835B49;
	Thu, 14 May 2020 00:55:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 22F385C1BE;
	Thu, 14 May 2020 00:55:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 273834E564;
	Thu, 14 May 2020 00:55:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04E0tJuf013053 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 13 May 2020 20:55:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 158A5128A8C; Thu, 14 May 2020 00:55:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 03F0C1248F2
	for <dm-devel@redhat.com>; Thu, 14 May 2020 00:55:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 473C48995D0
	for <dm-devel@redhat.com>; Thu, 14 May 2020 00:55:16 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-440-kYmkgRakOFSO_q9CWnecdQ-1; Wed, 13 May 2020 20:55:13 -0400
X-MC-Unique: kYmkgRakOFSO_q9CWnecdQ-1
IronPort-SDR: dEKOemy4sqmSOLRe7+R0m9Xs1tIaXBzpa0KwfUXVShGzCkwKyONxqyvVFLAJ8KrW+1sapZdie6
	T7RaatYa0jj4D0Be+T7pUfEXZy4S/43HuFWL/CY/eAO5M3RHQUlbdUoLMh5kohna/3aC2jt0WW
	KPWnB3EOzjjLpScfhGq5vIsdS9aCFizQI1i8HopHmObTGGkf7aMadX07A3wbvlKoTi3OYfCKta
	CPsUBl9MG0ZjJef0S3hC9dkmCuo8AOnGQHQL/hgHA/UMcSJIeqVAJvID1CPPPUq2AYCdC2/4FR
	58A=
X-IronPort-AV: E=Sophos;i="5.73,389,1583164800"; d="scan'208";a="240339368"
Received: from mail-co1nam04lp2054.outbound.protection.outlook.com (HELO
	NAM04-CO1-obe.outbound.protection.outlook.com) ([104.47.45.54])
	by ob1.hgst.iphmx.com with ESMTP; 14 May 2020 08:55:30 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB6852.namprd04.prod.outlook.com (2603:10b6:a03:225::23)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26;
	Thu, 14 May 2020 00:55:11 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606%6]) with mapi id 15.20.3000.016;
	Thu, 14 May 2020 00:55:11 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Thread-Topic: [PATCHv5 00/14] dm-zoned: metadata version 2
Thread-Index: AQHWJRechFCM8ZarfEqHZb3tednc9w==
Date: Thu, 14 May 2020 00:55:10 +0000
Message-ID: <BY5PR04MB6900B82F4BEE1B13B239D93EE7BC0@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200508090332.40716-1-hare@suse.de>
	<BY5PR04MB6900138C0F78196D0F81BF07E7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
	<BY5PR04MB6900C76141ABD428F42C1840E7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
	<2553e593-795d-6aed-f983-e990a283e2ff@suse.de>
	<BY5PR04MB6900C84D00585D3560D4C51AE7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
	<BY5PR04MB690020AE68E7A20EA8BFED0DE7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
	<BY5PR04MB690002ABF208B084607B6971E7BF0@BY5PR04MB6900.namprd04.prod.outlook.com>
	<yq13683z7sj.fsf@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6be98175-f92f-4a2b-95f4-08d7f7a1745a
x-ms-traffictypediagnostic: BY5PR04MB6852:
x-microsoft-antispam-prvs: <BY5PR04MB6852B785BE4CCE7D0A22C2DCE7BC0@BY5PR04MB6852.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 040359335D
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 51aFflg85hwJhPxQI+NQdc626GHc5CQqQgYKkchlkFyIQMmlle0r/r5hR/w1HlHp8gE57QlrNCxTQAgIDnWyrOBazR3/uDrYTWi7WYwByv5/JxUohR7xCoI7JwdDgfKdn17Km+G5Zqx43Lbu0FJu+ck/VcjHI841TBEHWT+UwXCPOfV11FTia+LrPDC40CJc74VFq9rq5lclCG9OD9mCW11YsOEWeQ7+ugn30pd0VQpalvmcRMEnRSowzhTbaamv/dPnYlTLLaRHPAyMfobxrUbJD9zzAc2yNwUG3MxilG/ur9kRbd71esioZJijbAhTmr5hO8xLku1PRO6QGlmewVL2ThjqKfIYEQtCh090xJXXXkE249lleYInaQ7JFbt4WVSnO98xggYSxCzMfUb+aNNh6Q5rDwYLoMo/ukc+ApEeIZAvVx+WALO7NpDldiSZ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(396003)(136003)(376002)(346002)(366004)(39860400002)(186003)(26005)(66556008)(66446008)(76116006)(86362001)(7696005)(71200400001)(6916009)(5660300002)(33656002)(64756008)(9686003)(53546011)(478600001)(55016002)(2906002)(66946007)(8936002)(316002)(4326008)(6506007)(8676002)(54906003)(66476007)(52536014);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: MmMz5yJaRCjz52nOEZT/LSCcJrOpy+iWUZs5u0ZDf7qhOZRm9vZE/ZF3/MPDilEKXgDQDcnXDjq8mJ6Xfh0p6irjZS1D+vwQ7zVZWws8Peyrb9l7uz0cRc8L0S83yVghoioC0phE3SiLZ91lLrR4PsFJ7ji4q1yVDBZKDgP8wBI0gRHl7i+2dvDIPzwJreqPsVbobYjgH861ginmA/nO5VQ8Qqm5Gp4hvm9FBSsT8sFBJfAtDJgLeT9fz57sVN7/8A49XKdwPwUeLbFolfPjek5bOP5AtENtA6u7PBdPemWx3BoHycggw3Rg+Ewc11NaKxyOhBZ5ic6mbRxwJB8YruuN1UGbSrfu7pAI4XGfxhYMMc8ynK2arh4OOhEQQ7BfSjwAK9c/EUOMtRgwoyHZa8Q5e49UkkB44nMnZoITd70EvsWu2L3kMvAcWs0l+Oa0rcXgcflohFW9k/oDqJDpvSg41eRuJS1VC5SjywHUCvhE1v8AFByq8X/5SI6Agfct
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6be98175-f92f-4a2b-95f4-08d7f7a1745a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2020 00:55:10.8172 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7U85TTxl5y0ucZGW/J7szDE2ARUQjjCOlNDvob6IN28nGCISpKisIHR/F8lehI+imM4m6PUVdvfyKNneg/XtcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6852
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04E0tJuf013053
X-loop: dm-devel@redhat.com
Cc: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [PATCHv5 00/14] dm-zoned: metadata version 2
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/05/14 9:22, Martin K. Petersen wrote:
> 
> Damien,
> 
>> Any idea why the io_opt limit is not set to the physical block size
>> when the drive does not report an optimal transfer length ? Would it
>> be bad to set that value instead of leaving it to 0 ?
> 
> The original intent was that io_opt was a weak heuristic for something
> being a RAID device. Regular disk drives didn't report it. These days
> that distinction probably isn't relevant.
> 
> However, before we entertain departing from the historic io_opt
> behavior, I am a bit puzzled by the fact that you have a device that
> reports io_opt as 512 bytes. What kind of device performs best when each
> I/O is limited to a single logical block?
> 

Indeed. It is an NVMe M.2 consumer grade SSD. Nothing fancy. If you look at
nvme/host/core.c nvme_update_disk_info(), you will see that io_opt is set to the
block size... This is probably abusing this limit. So I guess the most elegant
fix may be to have nvme stop doing that ?


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

