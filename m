Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5E8AA1E0496
	for <lists+dm-devel@lfdr.de>; Mon, 25 May 2020 04:10:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590372654;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=uJ2lRHk4XAQ8lqe+yXcaBf4SULLRA4aL+wCEMXjMwU4=;
	b=XAqH6sfRnZ2ceGn6M+RPkZRZNIFkpTa/OKSVLgUgAdq9cXc3yuwbHTskcIymVrGSIeaP5w
	qcZXjk3HInfYGa9AYb8Ueo3H2dPdEUvi8mvoYA/EvkmN6OOuQgIb5fvlkCmpPwVv7mUA5Q
	m05ZkrrbGso2DN+JbwHOjVjVp83c3Fg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-2QLU4qhuNN2Vb9fE_bGl6w-1; Sun, 24 May 2020 22:10:51 -0400
X-MC-Unique: 2QLU4qhuNN2Vb9fE_bGl6w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B92C107ACCD;
	Mon, 25 May 2020 02:10:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D8AAF10013C1;
	Mon, 25 May 2020 02:10:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F37BC1D82;
	Mon, 25 May 2020 02:10:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04P2Ag7K031328 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 24 May 2020 22:10:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EDE6D16873; Mon, 25 May 2020 02:10:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D655D176C5
	for <dm-devel@redhat.com>; Mon, 25 May 2020 02:10:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB1B1101A526
	for <dm-devel@redhat.com>; Mon, 25 May 2020 02:10:38 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-435--laK1TxuMlO8tW1H-7OA0A-1; Sun, 24 May 2020 22:10:34 -0400
X-MC-Unique: -laK1TxuMlO8tW1H-7OA0A-1
IronPort-SDR: 79SwCkmn4feXZsFaIIee0asHGwUKji7VJmYr/N4vp9rx05G7PasPbYUTxePr0gxwdpgFbwZh4e
	zpBzNgBL6kRhfgKYg/Mf9r+E5HYBK5Kt++UBNbPAkivYiMN8Po+yz6bTNcZPzUIt7CnqbnTo6f
	gyoMhyYsbA4oiSGVs7nGNkSio6hPhrBdTTQxKaVa8y7tkylb0Lhhs0n1zNVn4dPAsC14ui/3r/
	g51UNPpq16d0rxiaXbxnrYHFUdg2Csfz5BmR2aLQKBY1z7zTDwKf9w1TX5C4mp6r0HvXRhwJaT
	TPU=
X-IronPort-AV: E=Sophos;i="5.73,431,1583164800"; d="scan'208";a="139868532"
Received: from mail-mw2nam12lp2042.outbound.protection.outlook.com (HELO
	NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.42])
	by ob1.hgst.iphmx.com with ESMTP; 25 May 2020 10:10:33 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB0167.namprd04.prod.outlook.com (2603:10b6:903:3b::10)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24;
	Mon, 25 May 2020 02:10:31 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3021.029;
	Mon, 25 May 2020 02:10:31 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>
Thread-Topic: [PATCH 04/12] dm-zoned: secondary superblock must reside on the
	same devices than primary superblock
Thread-Index: AQHWME8nA8k7+e7ZpkWXerAPdO5uXg==
Date: Mon, 25 May 2020 02:10:31 +0000
Message-ID: <CY4PR04MB3751DACF536FC287B467D3FCE7B30@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200522153901.133375-1-hare@suse.de>
	<20200522153901.133375-5-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.47.8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e7925804-08f3-4160-69c3-08d80050cd97
x-ms-traffictypediagnostic: CY4PR04MB0167:
x-microsoft-antispam-prvs: <CY4PR04MB0167CF878CD08C3C04932100E7B30@CY4PR04MB0167.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 0414DF926F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tEotVW12eZxyveJTGswLsWIIpEizcEOSWOWqOpVM4HAV6UnD9Mz+Gb3JcmfmxiF2C88UCnwWys5oafMmtrWLP3+6NPRLtxMnuMGmRjps09bVWyBUBFcVu+2BghXjQRnLENX5vRNb6lpjXnELZZ8annB48Ky7NSNneysojX8S9b/HBc9vyhFSKlOzhRsH4/orqZomcznecEfOdxCAEp4k4CaJgQLZ+aDuhVU9jthzUEEkq54PvlwsuyXMQKGFkDl+vmCerG43heiYd16Cy07DKEXnFv/3lUpN2LgiycYciKezLsU8U5CrFMx2HArzQPF50sChe9jb9d2I0CdGUMcuEw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(39860400002)(136003)(376002)(396003)(346002)(366004)(316002)(53546011)(6506007)(8936002)(186003)(478600001)(86362001)(7696005)(4326008)(33656002)(2906002)(26005)(52536014)(66446008)(91956017)(66946007)(5660300002)(76116006)(6916009)(66556008)(66476007)(71200400001)(64756008)(54906003)(55016002)(9686003)(8676002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: pwfr5vAzdT43gPP9354e33rxlWu3vD1KrEbNSVCTKsu+t1koPjcAEohZdRCWVbHLNp6pNIir5WGNavPquqI69xRAmGbOLCSLUQmacy3iinAqcRSv2eWxk5h7zgBVj36aSGmmCcGg6r3GomswZwCEZgurGrRcm/IVptPDVnTUREx61ItUq5Bkm4avMYGxhgIGujGEy7y1J3uV/AKf6tt+sNMeNUk10kM1CLsW6FE3KASK1tcX2oZ9HxkjPaB63Mi7918Oc5f+EIGQTz1yUxDZLo9js+i8MCJsB4IkhkIuTNzmzQKCll0ADA33vz8AqIf8A2R5VAnYhmERKrZB0brlPDdqsO4NlpheL/IHUXcxD4rDrpWFhyhmoNSCUde2KMO+keRnQBAUJNAU9PuWQZCe7bhF/7S+nqDlER78POubLWj1R3r/zMOvYL6zu1UuN0tmJuTlx7xpzOioFGTd8i494p4qObswusZal7AQX3vxz7A=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7925804-08f3-4160-69c3-08d80050cd97
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2020 02:10:31.8771 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mn/r1oN1Mb7saa7WGIJzl9vopOskj0MwGEHDfTys7ouSDrkpCznx1g2Y4dq9JEbgFwR0zCmL4gPZuxupLYUuzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0167
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04P2Ag7K031328
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH 04/12] dm-zoned: secondary superblock must
 reside on the same devices than primary superblock
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

On 2020/05/23 0:39, Hannes Reinecke wrote:
> The secondary superblock must reside on the same device than the
> primary superblock, so there's no need to re-calculate the device.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/md/dm-zoned-metadata.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index b70a988fa771..fdae4e0228e7 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -1141,7 +1141,7 @@ static int dmz_lookup_secondary_sb(struct dmz_metadata *zmd)
>  	/* Bad first super block: search for the second one */
>  	zmd->sb[1].block = zmd->sb[0].block + zone_nr_blocks;
>  	zmd->sb[1].zone = xa_load(&zmd->zones, zone_id + 1);
> -	zmd->sb[1].dev = dmz_zone_to_dev(zmd, zmd->sb[1].zone);
> +	zmd->sb[1].dev = zmd->sb[0].dev;
>  	for (i = 1; i < zmd->nr_rnd_zones; i++) {
>  		if (dmz_read_sb(zmd, &zmd->sb[1], 1) != 0)
>  			break;
> @@ -1149,7 +1149,6 @@ static int dmz_lookup_secondary_sb(struct dmz_metadata *zmd)
>  			return 0;
>  		zmd->sb[1].block += zone_nr_blocks;
>  		zmd->sb[1].zone = dmz_get(zmd, zone_id + i);
> -		zmd->sb[1].dev = dmz_zone_to_dev(zmd, zmd->sb[1].zone);
>  	}
>  
>  	dmz_free_mblock(zmd, mblk);
> @@ -1272,7 +1271,7 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
>  			zmd->sb[1].zone = dmz_get(zmd, zone_id);
>  		}
>  		zmd->sb[1].block = dmz_start_block(zmd, zmd->sb[1].zone);
> -		zmd->sb[1].dev = dmz_zone_to_dev(zmd, zmd->sb[1].zone);
> +		zmd->sb[1].dev = zmd->sb[0].dev;
>  		ret = dmz_get_sb(zmd, &zmd->sb[1], 1);
>  	} else
>  		ret = dmz_lookup_secondary_sb(zmd);
> 

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

