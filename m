Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 58CD61D4706
	for <lists+dm-devel@lfdr.de>; Fri, 15 May 2020 09:26:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589527571;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LQdWCMInZLeQn28o3nfUD7MtDxXHRpmwmpL95iZ2orI=;
	b=Vdu+3NdOFanQ4vS0TtSbAvuPhur+HvpmBgZSvKwIjtLQ3oOokpHGlvyAF2/VcUEC1eDp60
	vnxduFBmOb7UEqdrWiOd5ignVOB9rCRfUV7HvuVPb4/x9Vum2Fa4FjE6dtetqpVKYYiqx9
	4859EwvFWr/q9pAYGmSx2LXYy3fF7IE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-BsXyi7lJMeehRmpov04UAw-1; Fri, 15 May 2020 03:26:09 -0400
X-MC-Unique: BsXyi7lJMeehRmpov04UAw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36C7F107ACCA;
	Fri, 15 May 2020 07:26:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DFF1B5D9FC;
	Fri, 15 May 2020 07:26:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 257594E9E5;
	Fri, 15 May 2020 07:25:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04F7PnIo031294 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 15 May 2020 03:25:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 172E1200BCF6; Fri, 15 May 2020 07:25:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B5172029F83
	for <dm-devel@redhat.com>; Fri, 15 May 2020 07:25:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C8268A19B1
	for <dm-devel@redhat.com>; Fri, 15 May 2020 07:25:46 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-220-yyAbOcyrO5GuRYK_l3U8GA-1;
	Fri, 15 May 2020 03:25:41 -0400
X-MC-Unique: yyAbOcyrO5GuRYK_l3U8GA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 7E111ACC5;
	Fri, 15 May 2020 07:25:42 +0000 (UTC)
To: kbuild test robot <lkp@intel.com>
References: <202005151432.U61i8wOc%lkp@intel.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <a1e65e5a-4b23-6c6e-d52f-7bf6eb69e7c8@suse.de>
Date: Fri, 15 May 2020 09:25:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <202005151432.U61i8wOc%lkp@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04F7PnIo031294
X-loop: dm-devel@redhat.com
Cc: Damien Le Moal <damien.lemoal@wdc.com>, dm-devel@redhat.com,
	kbuild-all@lists.01.org, Bob Liu <bob.liu@oracle.com>,
	Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [dm:for-next 53/58]
 drivers/md/dm-zoned-metadata.c:779:3: error: implicit declaration of
 function 'export_uuid'
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Mike,

On 5/15/20 8:32 AM, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/lin=
ux-dm.git for-next
> head:   6c871f63986b34c7768080259ddf5991c55ee385
> commit: 70978208ec91d798066f4c291bc98ff914bea222 [53/58] dm zoned: metada=
ta version 2
> config: nios2-allyesconfig (attached as .config)
> compiler: nios2-linux-gcc (GCC) 9.3.0
> reproduce:
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sb=
in/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          git checkout 70978208ec91d798066f4c291bc98ff914bea222
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=3D$HOME/0day GCC_VERSION=3D9.3.0 make.cros=
s ARCH=3Dnios2
>=20
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>=20
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>=20
> drivers/md/dm-zoned-metadata.c: In function 'dmz_write_sb':
>>> drivers/md/dm-zoned-metadata.c:779:3: error: implicit declaration of fu=
nction 'export_uuid' [-Werror=3Dimplicit-function-declaration]
> 779 |   export_uuid(sb->dmz_uuid, &zmd->uuid);
> |   ^~~~~~~~~~~
> drivers/md/dm-zoned-metadata.c: In function 'dmz_check_sb':
>>> drivers/md/dm-zoned-metadata.c:1015:3: error: implicit declaration of f=
unction 'import_uuid' [-Werror=3Dimplicit-function-declaration]
> 1015 |   import_uuid(&sb_uuid, sb->dmz_uuid);
> |   ^~~~~~~~~~~
> cc1: some warnings being treated as errors
>=20
> vim +/export_uuid +779 drivers/md/dm-zoned-metadata.c
>=20
>     761=09
>     762=09/*
>     763=09 * Write super block of the specified metadata set.
>     764=09 */
>     765=09static int dmz_write_sb(struct dmz_metadata *zmd, unsigned int =
set)
>     766=09{
>     767=09=09struct dmz_mblock *mblk =3D zmd->sb[set].mblk;
>     768=09=09struct dmz_super *sb =3D zmd->sb[set].sb;
>     769=09=09struct dmz_dev *dev =3D zmd->sb[set].dev;
>     770=09=09sector_t sb_block;
>     771=09=09u64 sb_gen =3D zmd->sb_gen + 1;
>     772=09=09int ret;
>     773=09
>     774=09=09sb->magic =3D cpu_to_le32(DMZ_MAGIC);
>     775=09
>     776=09=09sb->version =3D cpu_to_le32(zmd->sb_version);
>     777=09=09if (zmd->sb_version > 1) {
>     778=09=09=09BUILD_BUG_ON(UUID_SIZE !=3D 16);
>   > 779=09=09=09export_uuid(sb->dmz_uuid, &zmd->uuid);
>     780=09=09=09memcpy(sb->dmz_label, zmd->label, BDEVNAME_SIZE);
>     781=09=09=09export_uuid(sb->dev_uuid, &dev->uuid);
>     782=09=09}
>     783=09
>     784=09=09sb->gen =3D cpu_to_le64(sb_gen);
>     785=09
>     786=09=09/*
>     787=09=09 * The metadata always references the absolute block address=
,
>     788=09=09 * ie relative to the entire block range, not the per-device
>     789=09=09 * block address.
>     790=09=09 */
>     791=09=09sb_block =3D zmd->sb[set].zone->id << zmd->zone_nr_blocks_sh=
ift;
>     792=09=09sb->sb_block =3D cpu_to_le64(sb_block);
>     793=09=09sb->nr_meta_blocks =3D cpu_to_le32(zmd->nr_meta_blocks);
>     794=09=09sb->nr_reserved_seq =3D cpu_to_le32(zmd->nr_reserved_seq);
>     795=09=09sb->nr_chunks =3D cpu_to_le32(zmd->nr_chunks);
>     796=09
>     797=09=09sb->nr_map_blocks =3D cpu_to_le32(zmd->nr_map_blocks);
>     798=09=09sb->nr_bitmap_blocks =3D cpu_to_le32(zmd->nr_bitmap_blocks);
>     799=09
>     800=09=09sb->crc =3D 0;
>     801=09=09sb->crc =3D cpu_to_le32(crc32_le(sb_gen, (unsigned char *)sb=
, DMZ_BLOCK_SIZE));
>     802=09
>     803=09=09ret =3D dmz_rdwr_block(dev, REQ_OP_WRITE, zmd->sb[set].block=
,
>     804=09=09=09=09     mblk->page);
>     805=09=09if (ret =3D=3D 0)
>     806=09=09=09ret =3D blkdev_issue_flush(dev->bdev, GFP_NOIO, NULL);
>     807=09
>     808=09=09return ret;
>     809=09}
>     810=09
>=20
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
>=20
This is cause by missing commit d01cd62400b3 ("uuid: Add inline helpers=20
to import / export UUIDs"), which went into 5.7.
Mind to update your tree?

Cheers,

Hannes
--=20
Dr. Hannes Reinecke            Teamlead Storage & Networking
hare@suse.de                               +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 N=FCrnberg
HRB 36809 (AG N=FCrnberg), Gesch=E4ftsf=FChrer: Felix Imend=F6rffer


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

